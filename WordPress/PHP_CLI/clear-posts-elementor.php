<?php

function execClearElementorPosts(string $mode, ?string $post_id = null) {

    if ( $mode == 'all' ) {

        $all_posts = get_posts( array(
            'post_type'      => 'post',
            'posts_per_page' => -1,
            'fields'         => 'ids',
        ) );

        foreach ( $all_posts as $id ) {
            clearElementorPostMeta($id);
        }

    }

    if ( $mode == 'post_id' ) {

        if ( $post_id === "" || null ) {
            echo "É necessário o ID do post";
            return;
        }

        clearElementorPostMeta($post_id);

    }

}

function clearElementorPostMeta($post_id) {

    if ( $post_id === "" || null ) {
        echo "É necessário o ID do post\n";
        return;
    }

    // Valida se o post existe e é do tipo "post"
    $post = get_post( $post_id );
    if ( ! $post || $post->post_type !== 'post' ) {
        echo "$post_id não é do tipo Post";
        return;
    }

    echo "Iniciando limpeza do post ID: $post_id\n";
    echo "-------------------------------------------\n";

    // Remove dinamicamente todos os metadados relacionados ao Elementor.
    $all_metas = get_post_meta( $post_id );
    foreach ( $all_metas as $meta_key => $meta_values ) {
        if ( strpos( $meta_key, '_elementor' ) !== false ) {
            delete_post_meta( $post_id, $meta_key );
            echo "✓ Removido dinamicamente: $meta_key\n";
        }
    }

    update_post_meta( $post_id, '_wp_page_template', 'default' );

    echo "\n-------------------------------------------\n";
    echo "\n✓ Limpeza concluída com sucesso!\n";


}
function clearCacheElementor() {
    // Limpa cache do Elementor (se plugin estiver ativo)

    \Elementor\Plugin::$instance->files_manager->clear_cache();
    echo "✓ Cache do Elementor limpo.\n";
}

global $args;

/*
    all = Ajusta todos os posts do post type "post"
    post_id = Define um específico.
*/

if ( ! isset( $args[0] ) ) {

    echo "É necessário o modo, all (para todos os posts) ou post_id (para um id especifico)\n";
    echo "Sintaxe: [modo] [id do post (se for post_id)]\n";
    echo "Exemplo: clear-posts-elementor.php all\n";
    return;

}

if ( strtolower($args[0]) === 'post_id') {

    if ( ! isset( $args[1] )) {
        echo "É necessário o id.\n";
        echo "Sintaxe: [modo] [id do post]\n";
        echo "Exemplo: clear-posts-elementor.php post_id 8254\n";
        return;
    }

    $id = $args[1];
    execClearElementorPosts( 'post_id', $id );
    clearCacheElementor();

}

if ( strtolower($args[0]) === 'all' ) {

    $id = $args[1];
    execClearElementorPosts( 'all', $id );
    clearCacheElementor();

}

?>
