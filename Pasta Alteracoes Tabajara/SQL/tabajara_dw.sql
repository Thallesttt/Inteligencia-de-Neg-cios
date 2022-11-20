PGDMP                     
    z            tabajara_dw    14.5    14.4 $               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24599    tabajara_dw    DATABASE     k   CREATE DATABASE tabajara_dw WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE tabajara_dw;
                postgres    false            �            1259    24816    dim_cliente    TABLE     a  CREATE TABLE public.dim_cliente (
    sk_cliente integer NOT NULL,
    nk_cliente character varying NOT NULL,
    cpf character varying(50) NOT NULL,
    nm_cliente character varying(50) NOT NULL,
    data_nascimento date NOT NULL,
    data_cadastro date NOT NULL,
    sexo character varying(50) NOT NULL,
    numero integer NOT NULL,
    estado character varying(19) NOT NULL,
    municipio character varying(5) NOT NULL,
    logradouro character varying(5) NOT NULL,
    bairro character varying(5) NOT NULL,
    etl_versao integer NOT NULL,
    etl_dt_inicio date NOT NULL,
    etl_dt_fim date NOT NULL
);
    DROP TABLE public.dim_cliente;
       public         heap    postgres    false            �            1259    24815    dim_cliente_sk_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_cliente_sk_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.dim_cliente_sk_cliente_seq;
       public          postgres    false    214                       0    0    dim_cliente_sk_cliente_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.dim_cliente_sk_cliente_seq OWNED BY public.dim_cliente.sk_cliente;
          public          postgres    false    213            �            1259    24737    dim_data    TABLE     U  CREATE TABLE public.dim_data (
    sk_data integer NOT NULL,
    nk_data date NOT NULL,
    desc_data_completa character varying(60) NOT NULL,
    nr_ano integer NOT NULL,
    nm_trimestre character varying(20) NOT NULL,
    nr_ano_trimestre character varying(20) NOT NULL,
    nr_mes integer NOT NULL,
    nm_mes character varying(20) NOT NULL,
    ano_mes character varying(20) NOT NULL,
    nr_semana integer NOT NULL,
    ano_semana character varying(20) NOT NULL,
    nr_dia integer NOT NULL,
    nr_dia_ano integer NOT NULL,
    nm_dia_semana character varying(20) NOT NULL,
    flag_final_semana character(3) NOT NULL,
    flag_feriado character(3) NOT NULL,
    nm_feriado character varying(60) NOT NULL,
    etl_dt_inicio timestamp without time zone NOT NULL,
    etl_dt_fim timestamp without time zone NOT NULL,
    versao integer NOT NULL
);
    DROP TABLE public.dim_data;
       public         heap    postgres    false            �            1259    24809    dim_funcionario    TABLE     �   CREATE TABLE public.dim_funcionario (
    sk_funcionario integer NOT NULL,
    nk_funcionario integer NOT NULL,
    nome character varying(50) NOT NULL,
    etl_versao integer NOT NULL,
    etl_dt_inicio date NOT NULL,
    etl_dt_fim date NOT NULL
);
 #   DROP TABLE public.dim_funcionario;
       public         heap    postgres    false            �            1259    24807 "   dim_funcionario_sk_funcionario_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_funcionario_sk_funcionario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.dim_funcionario_sk_funcionario_seq;
       public          postgres    false            �            1259    24808 #   dim_funcionario_sk_funcionario_seq1    SEQUENCE     �   CREATE SEQUENCE public.dim_funcionario_sk_funcionario_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.dim_funcionario_sk_funcionario_seq1;
       public          postgres    false    212                       0    0 #   dim_funcionario_sk_funcionario_seq1    SEQUENCE OWNED BY     j   ALTER SEQUENCE public.dim_funcionario_sk_funcionario_seq1 OWNED BY public.dim_funcionario.sk_funcionario;
          public          postgres    false    211            �            1259    24823    dim_produto    TABLE     �  CREATE TABLE public.dim_produto (
    sk_produto integer NOT NULL,
    nk_produto character varying NOT NULL,
    modelo character varying(50) NOT NULL,
    marca character varying(50) NOT NULL,
    preco numeric(6,2) NOT NULL,
    descricao character varying(26) NOT NULL,
    nome character varying(21) NOT NULL,
    etl_versao integer NOT NULL,
    etl_dt_inicio date NOT NULL,
    etl_dt_fim date NOT NULL
);
    DROP TABLE public.dim_produto;
       public         heap    postgres    false            �            1259    24822    dim_produto_sk_produto_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_produto_sk_produto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.dim_produto_sk_produto_seq;
       public          postgres    false    216                       0    0    dim_produto_sk_produto_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.dim_produto_sk_produto_seq OWNED BY public.dim_produto.sk_produto;
          public          postgres    false    215            �            1259    24829    ft_venda    TABLE     a  CREATE TABLE public.ft_venda (
    sk_produto integer NOT NULL,
    sk_cliente integer NOT NULL,
    sk_funcionario integer NOT NULL,
    sk_data integer NOT NULL,
    dd_hora_venda character varying NOT NULL,
    dd_codvenda integer NOT NULL,
    md_qtd integer NOT NULL,
    md_desconto character varying NOT NULL,
    md_valor_total real NOT NULL
);
    DROP TABLE public.ft_venda;
       public         heap    postgres    false            p           2604    24819    dim_cliente sk_cliente    DEFAULT     �   ALTER TABLE ONLY public.dim_cliente ALTER COLUMN sk_cliente SET DEFAULT nextval('public.dim_cliente_sk_cliente_seq'::regclass);
 E   ALTER TABLE public.dim_cliente ALTER COLUMN sk_cliente DROP DEFAULT;
       public          postgres    false    213    214    214            o           2604    24812    dim_funcionario sk_funcionario    DEFAULT     �   ALTER TABLE ONLY public.dim_funcionario ALTER COLUMN sk_funcionario SET DEFAULT nextval('public.dim_funcionario_sk_funcionario_seq1'::regclass);
 M   ALTER TABLE public.dim_funcionario ALTER COLUMN sk_funcionario DROP DEFAULT;
       public          postgres    false    211    212    212            q           2604    24826    dim_produto sk_produto    DEFAULT     �   ALTER TABLE ONLY public.dim_produto ALTER COLUMN sk_produto SET DEFAULT nextval('public.dim_produto_sk_produto_seq'::regclass);
 E   ALTER TABLE public.dim_produto ALTER COLUMN sk_produto DROP DEFAULT;
       public          postgres    false    215    216    216                      0    24816    dim_cliente 
   TABLE DATA           �   COPY public.dim_cliente (sk_cliente, nk_cliente, cpf, nm_cliente, data_nascimento, data_cadastro, sexo, numero, estado, municipio, logradouro, bairro, etl_versao, etl_dt_inicio, etl_dt_fim) FROM stdin;
    public          postgres    false    214   f2       	          0    24737    dim_data 
   TABLE DATA             COPY public.dim_data (sk_data, nk_data, desc_data_completa, nr_ano, nm_trimestre, nr_ano_trimestre, nr_mes, nm_mes, ano_mes, nr_semana, ano_semana, nr_dia, nr_dia_ano, nm_dia_semana, flag_final_semana, flag_feriado, nm_feriado, etl_dt_inicio, etl_dt_fim, versao) FROM stdin;
    public          postgres    false    209   R                 0    24809    dim_funcionario 
   TABLE DATA           v   COPY public.dim_funcionario (sk_funcionario, nk_funcionario, nome, etl_versao, etl_dt_inicio, etl_dt_fim) FROM stdin;
    public          postgres    false    212   �                0    24823    dim_produto 
   TABLE DATA           �   COPY public.dim_produto (sk_produto, nk_produto, modelo, marca, preco, descricao, nome, etl_versao, etl_dt_inicio, etl_dt_fim) FROM stdin;
    public          postgres    false    216   �                0    24829    ft_venda 
   TABLE DATA           �   COPY public.ft_venda (sk_produto, sk_cliente, sk_funcionario, sk_data, dd_hora_venda, dd_codvenda, md_qtd, md_desconto, md_valor_total) FROM stdin;
    public          postgres    false    217   ��                 0    0    dim_cliente_sk_cliente_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.dim_cliente_sk_cliente_seq', 1, false);
          public          postgres    false    213                       0    0 "   dim_funcionario_sk_funcionario_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.dim_funcionario_sk_funcionario_seq', 1, false);
          public          postgres    false    210                       0    0 #   dim_funcionario_sk_funcionario_seq1    SEQUENCE SET     R   SELECT pg_catalog.setval('public.dim_funcionario_sk_funcionario_seq1', 1, false);
          public          postgres    false    211                       0    0    dim_produto_sk_produto_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.dim_produto_sk_produto_seq', 1, false);
          public          postgres    false    215            w           2606    24821    dim_cliente sk_cliente 
   CONSTRAINT     \   ALTER TABLE ONLY public.dim_cliente
    ADD CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente);
 @   ALTER TABLE ONLY public.dim_cliente DROP CONSTRAINT sk_cliente;
       public            postgres    false    214            s           2606    24741    dim_data sk_data_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.dim_data
    ADD CONSTRAINT sk_data_pk PRIMARY KEY (sk_data);
 =   ALTER TABLE ONLY public.dim_data DROP CONSTRAINT sk_data_pk;
       public            postgres    false    209            u           2606    24814    dim_funcionario sk_funcionario 
   CONSTRAINT     h   ALTER TABLE ONLY public.dim_funcionario
    ADD CONSTRAINT sk_funcionario PRIMARY KEY (sk_funcionario);
 H   ALTER TABLE ONLY public.dim_funcionario DROP CONSTRAINT sk_funcionario;
       public            postgres    false    212            y           2606    24828    dim_produto sk_produto 
   CONSTRAINT     \   ALTER TABLE ONLY public.dim_produto
    ADD CONSTRAINT sk_produto PRIMARY KEY (sk_produto);
 @   ALTER TABLE ONLY public.dim_produto DROP CONSTRAINT sk_produto;
       public            postgres    false    216            |           2606    24842     ft_venda dim_cliente_ft_venda_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ft_venda
    ADD CONSTRAINT dim_cliente_ft_venda_fk FOREIGN KEY (sk_cliente) REFERENCES public.dim_cliente(sk_cliente);
 J   ALTER TABLE ONLY public.ft_venda DROP CONSTRAINT dim_cliente_ft_venda_fk;
       public          postgres    false    214    217    3191            z           2606    24832    ft_venda dim_data_ft_venda_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ft_venda
    ADD CONSTRAINT dim_data_ft_venda_fk FOREIGN KEY (sk_data) REFERENCES public.dim_data(sk_data);
 G   ALTER TABLE ONLY public.ft_venda DROP CONSTRAINT dim_data_ft_venda_fk;
       public          postgres    false    3187    209    217            {           2606    24837 $   ft_venda dim_funcionario_ft_venda_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ft_venda
    ADD CONSTRAINT dim_funcionario_ft_venda_fk FOREIGN KEY (sk_funcionario) REFERENCES public.dim_funcionario(sk_funcionario);
 N   ALTER TABLE ONLY public.ft_venda DROP CONSTRAINT dim_funcionario_ft_venda_fk;
       public          postgres    false    217    3189    212            }           2606    24847     ft_venda dim_produto_ft_venda_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ft_venda
    ADD CONSTRAINT dim_produto_ft_venda_fk FOREIGN KEY (sk_produto) REFERENCES public.dim_produto(sk_produto);
 J   ALTER TABLE ONLY public.ft_venda DROP CONSTRAINT dim_produto_ft_venda_fk;
       public          postgres    false    3193    217    216                  x��\�r�F�}���~�'����H��4�8�JZ)vc_
@��
8�n���L��|�lOVݔ�@��Ffw1�2O���U�q6�{�����.���?�9���/�#R��B�J�I��V!q+�u�X��4��ĩ��Oq�||`��'���G)_p�Bvͤ����ݯ�Y?N�������ϗ��iB����0�xnז�JS�y�2Mqj�Ia^p�#OK�7L�3����Ud���x����+*fb%u�6h���Ʊ���c�dߧDV��QM�"hu���c?�~������8֘���-�s���R���db�?�w?5M±X|ʿP��c���{7�8tk,5�v.�ZW�	�$W���.�xl�8��E�ￌ��I�0۫�5��s����ש�y�+,�,�[�^�CZ��ԧ������i�t��ھ�w����^m0�1��^X˙�ю;�go��=�7��W򪲦~!GVd}���i���
K=���C|p�/wF����#����iA�?)f#Eqc�U#���4��㮁g�����%y�|��sn��u���iw٧�[r,E?.�l,~��;��w���Tā�U[���q�,<���#['��7�BhO1d���S9�9���5G
�� 	�md�p�/w�)v��{���w�P�]��R���ɺ9�>�U�=��
c%��4��<h@�CH	�f�'x�0t�-Y*Լ�eM�`�)��]c�b6y�*���[�,Wc������}�"k�T���S����i�}u��@~a�8g�`�W��� _N0uܽN_�l0���r�dA[N��� �0@�(���	ϑ ��I=�ī��LO�a�����>�=�0� �nد���$!�FxO�����8�^N�����N���w8��3f���Y�;�c�׈ �.>�>��-�qB�ysa5ᄱ좏�c\e%H� '�.VC�7��� 
븻��a?��ȅ��% �����m�j*͔TA#�q$�w��&֗��������yV.�;
�84� �HSk �Ù��\D[锓�e�F<N]����UE�g������.��6�qաA��XZ��g���4VO�>&�m��~[�J�j�|���5�������jJpe��m�'s	I.�)ѭ�R��n��2e�V�$hb?�����i�t�d��dtE�6�J�C}�M��E�6�5����ɃӒ]�j���!M��Tr���.���R�����5�f��'�/����G?��~�_�����F����,(�HbC��@mc�&��M���WpJ���� rH}C�,����0�D/���s^�sM�o�1;V��
��?A*�-e�.�n������+�9lN;M�MmA+W�T5��U�i張�Cw�D1D����پ9�Ն��j�#RL�m���a������>�}�v�O��%�j岺.IWo����̈`P�2�s\8�+�ԧ������r�6ǐZvY�4~�U+d�`�#���g%����%��S���EJF:�s��C�dw"q+�^5������{�~xL�Ӏ��hU�uNE�Z�aNXa2�_�q5��H����؏� }�������-)�[�Xa�� ��V�Pe_�_����K,�3t��U�C&��&V�t�m�S5���DJ/�%����.M_���ʫ���m(R%�]��*_�,4޻Dŀ� ��N]���n_CA��=e���;m��$ �Lq���kltL��ۺ�,� �z��5N�G������nv%yf�)I^��=*(�F��Z $+%{�+�M��Glq�{\���&�d1����)-�c0U�2�E@�r�X�S�d�:V�k&����{��ѧ\�6
�����S����-��NTJ�akMq��>����T)&,�qc�#��槈,?�S��mA'"T�Cp����
+%�)�<!ꭔ�~�bW��Г�E,YV��sv��B�xp%��ս���/q����*N�9Ϫ�!�%R@�M�z�%��衙���A
 E�)�L1�3S�z��lNH<�]�ǯ#r�s�Mh�f����.�p����!��D����G9��#X����H��e�E���Fq��O��X����#L���s�$'����c���5ё�^oDBM`�q�O�K�f��c5�#���F�k����־m[�V��E�Er�&��v��@[]��"n��D����̬T���)B[�<W
�茶{�s��!}I!�������Ԧj�ሢ*�b@^���'��� ��d=��Ϫؾ��o�Ɋr+�i���Ƃ� 2���c�����t�f(��mb��Bf��
��w�A�&Ǡ�S0�rv�`���6��"z	+�ק]��������9��wWGd����>��v���,�&1�}��h�P�Z֑!��uNr�E�~�wNi�2�;̤��8q��\MAZ���Z�:�d�
%<�C����4!h^��d)�XB+6��w[n�`-�PC�C)�x8��+|����]�KK�2��@b����+Lwȏ�uS��H�TՒ]��]�����$�H.�.���"ڳ&�FՠΊJ����Y����� ��Yu�9��ܿ�j�&`�Z)��Yp< ����kd���I�z�W\�(���s�-B[!_�T�Pt�+8�G+I�������j.q�̜����@�R��!�6�,r�$�^"Y~��U���ɲ��YBl�!P�1����sN���P{�!O}J� �2#vȭ���$�%8�ٯVX������S�?(�+�C��0yz}LE�f,j%71�2�w���F�� Cj����T�Uc�%ϥW��ڪ$`��V�1�)J�,\&�.Z$��8�O%��!�0_���� �0�2��1�n��CP�_u����|�!�rl>Wq�#E�k�j�O��yMsMUg�m� c)���8�0̰I5��V��� �Ax�����m���~w�Ԟ��煓�0���x���kl���1��}����叱;$�ŧa�|���)��u��q
��
����k�w�U���s_��i*5�¬���0H�ː ���AK� ��	���g$ݙ�iw'h�T7��9t.��m���ր�ZoI^��zW�=�h��nhn��r�%`�"�Ϸx���sm ��T�*��������i���y�8w,Ջ���Iد"�N���FW�ec�u�o��eBz��C�P��˥"�l͵�=T�c@��� �A��{{9�_��L���(4}K�<��U�S�M`��n��=l���P�)�i���ν7�)�8�ǹ2�e�!�x�2�����K��׹�Y�W��Z�/���N�^�h`�IMsh/���4���s=�K?��_gF�e��n��.0]��M�Z�+��|{�JO��t��FLt��-�g�H	�^�xbCm ��@��&�z��w.%�}�f�5"7mk�Cb��N!���*Ox��Gh�DU���4QS�����3��7��U|�<RW��y|P�	�5D|�}�&<���lI�@����'�B��Nߎ8���a�2gBZv�etʩ��f��j��hu�?8)@�(�X��HV��w�����{[��6%��
k���,Ӑ�_���A���r��C�!�r�=��&�EAG�@��V���?]j�"�n�RM�=]�.l9n-�!Q��yE�ZN�	�f�;v���S&��&aN�b�O�������[��Rw(� �#=�5�H��I,K�i��RT(��f��H�cD�m|D�D>��mΕ��N{��-�%pZTA�p�=ib��!��c�8K'yF�����X:�+���%��c���Y Y8�D�
�B*qi�V�9T�b0v��}����MA��`ǹs8c�e����yߍ�~K�0]?�T�����Z6����1��&�h�w���]��f�Η:�7��MA�;�"�p�r	VtX�ǾJQ�gW�Ϧf|�/��.`Uh�t�>�R� ����C���?�w��V|�?,\W�a���5�����q��[��(	fO�@���!v��l�9�,�]x���9��Xl �  EU��f:�DT0��A �����X��8v}�b��Xa.�� 64��I���P]�Є�f��?܍�Sj�sKXC����m"�`��M֘����:2�s<��]v/�=��tI�w��ޢx����
�bV�#
�,A�	��.��P|��_
.r�@���b�iUk�)�]�����c7�X.���:�0g�Q�˔�m3�Hb���+�qNc�@SZ��K75��'ъ^^X1q�< '�L ���[m9��s�h#	G�Ï`�Ķ�R����]6W�)�Ws�<�۶
&Z�<w4�H9�^ǧj�k�5,�#�Y��m"��y��iMŴ�6`�!��\�e{Ke�Ӏ� ��w�]��MT-�=5z� +A������C�S.���y�~N�v�k�DUEáyc5hT�o�&�������\	٥��oG��X�Y*�6P��qoifԳT(��z��k�n�"u?ORn�h	�MP;M�=�+�JxC��&M4&����\�w2�Lù�D��|_9\P�K����,(�����*���kW./�]F;��%WX��5q��ƕ��J�~����6��g�Y"�tj�B(�V�BH֊�V1�n���7����n����Y3c�I���2)@	���s�TFj�9xiV_�O��Mi֖j��{�R���3�8Zk���R�i}%iڋ�w�w�����Bεb1O�@�m�%B�����N��~9P�ߢ�&��+L�M�C|��X��l�[�&��U��$	�*����:u���C�gXX�oR�ԍd΃�[1��_b�vo���n{h{Z��=��V羇�2���х�2 ̔Q̡�����ȴOC�L����)���^ ���TB�h5��.�`]��.z���i���_)'���Ē(r������
ӱk�{" �Dt���/�Ɖ�!���x�s�$ec�-��O-�Z����wT���#5��Ի��/i9���P�b�*�4��
��	�)��!����S��^�"��_]ۀJ�&�"������_	K��t�_���]ڧ�J'��󭊰š���P�!����NsU�@�h"���cI�S�t�d��"+�& �ښ�`d%�x*&��_��x�x8P�s=8�RY�zy����A��m��7�aCI��H�	Ǟ�Tb��\K�V�k��mf!`�m�l#���:Q�+@tC��p�b3W��f6�
&��$y��eK�i�Z�AB��a��,sA��#瞸���H WۊF��\(
"C����Ow`�_�S�,
��,I���ʦ�q�������y%�S�Z/�ʅN��p{��9�y=�b����������ZGeQ����c	�L�gL��Ԙ�%4��r>�*͛�FD����x}�/��*ey�u�*L;�����ĉ2K��y�����@F3<@�8GS��,�4�4��$W)X_��ΐ�B�O/:X�q\�Z�\a�)1���Sbe���3�A�_I��5>w���Wy�[�ueD���7�9ܶ�,�Fm���A�Aq?Ҧ�>u4�9��OG�.�(ˆ���1�\��|) j��gS���Ҽ4�o&�C��J����6I����W� 	<q����c�>d�m�S�"�t��Dse�A����B�����q���g$����l��b'�+�+LFl�!h�c9$�4�d��|��1fQ�z�R��M0�֎���~�xB�Z'VB�̼!Տ������7-Wq�K=�u�(�T-��QP`�&�}�����S�����f?p[�rKV8_N� hG��>ݧ!_ֿ�9�����t)��2ҹ�~=	Pi�Yz'���A�,{�H�����D��1�.�<79_;�[j�ڰ
��%���B�[�{3�\���9� �i�ϣ� ��>NQ��D�#mt��זdP�v����t7W����L�=i���4%��b	�<���>#?���TS�����v�]/Q�ЛF��8��� ��ꋦ��~D�Z���xX�<6�1��R�ā��w���(> O_�p�f�⚻�7�g�W�k��F�
�OXͥ<����w�p�<ar	�t�)�[f/�,z��J�c&�s��`w�����Y.L���s��U*g�J#Ym�Di�A�a���c������>�rg,^�\ӽ�ճC�(�~eT���g�� 6?�K��fiH����A�P&�7�
�Y�m#詣�UVR1��� 8u�!=��˾t0(x~���R�C�V��`S�T��*Hp��RJ�m�S6�N�GS�����4����x���х���qoy��?�=�)���&Wv,�h�HSz�S��!��>ҏ���|e%�?����Q���ule�U��Y���d�J�8P�s��f�\����ǌf�ف��JVҠ����?��;���ɷ	ʢ?����Y�����=��@u�ځ�҄�ȉ�z��݇�4V���|���j�]��'V�k�S-!T������Ki��Ẓ
�<���ۛ�łB��8\�Ҩyp�H.$�ww)��`~�F��:s��U,�Dj �xAm�!�ή�Ӟ���=͔X��ͥe�U��V��*@V�Ƚ�F� n%�L��ȱ��89/>�ݿ����d �tcm0-��	��`�H���XF��������/��וּZˌv���@���3`�p9���a��8��/gQ"��ՁA��4p� �Z���y�ay1c��yV$�in���B�m�K�-�) ��Lh��Tʓ{�M�r���)_��<��Qa��]b��'״����Di�FQ��iwul�u&g�gj3�kO[
4��|�*V`�y�B{qzA,N}�}��1��i�ܔtK�k}�:��Z��c��qy2Z�Qـ
`���[=�[AK�/7* ��7����*�xR �j���ƶ��Fݜ��N�K����kkdw_3�0:>�&v?�1�@]Q)�:+��wS�����3θ��S�����ߎ��"ݳ�(b�a�@_V�<���0%���`��@9�%bg���4��[�s#J͝7���),��+k��\�����qH��N-�e��M��Y�C�/�;� �l����^=5��I��yTo�E��Ol��� O��A�j�8U���g�©�ɲ-j!�V\��w4���cS��RU��+����V�%X��[�RD0��ɕ�M����C:��aϏ���V��켈���"C%�4�h>+�k҇������q�ͯӸ�Т{�QH��H=e���)밑Լ��U���t�Ӌ-�&b)�]S�|u>��x-H0q3� ���<�N��|�`�/`�|@Z�?X_J�a��[t���KE������?ty$/�w:V=���WLn(���+iW�qmb���5�!��O{b+,_! ���r�w�xФh�n͠t8�R/I�>t�7qjR� �y�G�_+������E�J3n��5�&��_��ϥ7L���2��p���<�mUU������X!VyK�\��C
q���sO�Pn��� '�L���.@�8��e~�t|,���N'���ﴖ��%u[��K�wz�����<R{�'�/�xʮg�άB��T�
�C�䁧HС��k�����K_&�\֧i��|MF���@Л*9���=}sl��.dVs��Y��ϳ�w�f�ݐ|:�FWA
0�8+ 3��-=�������>�n�}Mnj�q��5�]�	�1t�����uw{{�;_�\f?�,���w�[��Xfe�M�ί�Y&[�Xu}Co�����J���M��X���	*����(P�ؒ��|n�PV�2��Y�Et��[�}g�H��L����E�J�s�����N�Y~I�<'���\&��_��]	��Ȉ�)kiͫ����Q��?Q,y~�*OP��{ ��ԍ����b����qBqy���..��3t��#�8lqglKpe���v�!@k�X
��@��,�y~)� ��+���o�ӟ��G
      	      x���]�$G���l���@]EL�����b����� �@2���$���<4��Я��1��u;
p���{�B-������1Q��vK���>��[ҏ햾����~L�q}���^�?|z=����f{Z��Ǥ��������O��<m?|�_��|�m�������"�J��ȻT�׭�����[˵�����$��ӻ���[������v��^d��׿����Eu����������O��f��c��Ͽ�����aa�ne�0�gE����/����w���G9+8�v�!Ϊ�������00�vk!̦���ߟ>}�a��ܷ���������"ff�n=���������R�<���<��.�nP��[�\Iۆ�F����&۹��%��>M+�sGz~p����ѧi%{�@m%y3J� }�V"��V����ҧi%��@m%wCJ!�Y	�;N[�ے@�4�����mI}�V�'�3�᱕�-	�O�J ݑ�J�$��i�\IޒqdOW���V��$A�ӕ4����-IF�t%��8�֖$�!{�Cw����%	Ȟ�P�g�h+�[� ���Jݑ�J��� ��+Atj+�[�Ȟ�����doIH#{��Fw����%e��>�+a�s%mKʈ!}�Wb��V��$��P�"��e�����Ow��U��oY�{�L](C�Pe˙�)�Ԇ2�a�4o�pw%��P�>��wi�nK2��"տ�Fݗd*D
1ڶ��6&��P�?1�[����͟��o���LP/�B=�r#�LS%�P�!R][ykJH&W�1T�R!�M	��N1�*[���)!�\*�H�V
mwJ%�1Ȳ�J۞��e����vs������Hr�cm[�����bu�JgoP(�1Ծ���A!��0�P��޸� �\1�HumM�JM�c�i�B۠��jq���nf�f�%�%׋1ּ�Bޠ��1�Z�Z�� �\7�P�US#oP��r�Cm[��ʅc�t�j�mP�&��1Ⱦ�D۠J. vz�v#oPyj�<4Y~�5oz��g��;д��ݜ�Tdy(�uL�Z�S�~,?�������R�r,9��Y�V�R�b,1�NY�VY�Q�B,!�ض�XQ�6,�(��o�q��N߅:@/% �[��m� ������ �Cӆ�a�����Fމ��]X4m�M��QN䏋���F�U�sB��� �m�u�sB��z����MR�����	��,BZ�����	�,ڶ����	Y��+�o;�۝���W�o;�ݝ���W���vZ�;bȝW QWvZ�;ȍ�È���Ǵuv�;"ȵW�T_���YD�"�y��~wđ�h�:�ߝi�+Z���wgA��p�����YCn�"���i��, w\#z�������,� ]�c��~w�"��@u�A�w�8�b]4m��]�7,��{P�w�e���O>:g��TLn��LmX�6\����u���e�u���fw���U�(�=����^�>��>��~ϙ���|߾�������G�O����-���e����ʺ��y�V����ٶ�\;/�m��6�1�� ���4�e��u̾��y�^���N��Ao��y�?�e�|��i����2E�⩙&���]8/	��63@�o�yI�Gw�P��yI�I7�P�%��KB����Ǎ[6/	)�^3�i}^Z׼$$�� ���A�����q��(��M��P��M�@n3��0���ED�4�A�޳"�̋ ��l@-��*��7�����/_�?��C�4�6^�[./�r��4�M��A �� �g�V,/��q��(��D�G��]+/��q� �;4ȥ�"� ��P��D��A���j%r��rȕf TsH�u�Cn4�9�Uhe�:a����X�?=}F��j�����������w?~z����J�)�(@�����^%���fHp7�:5a�p���� W�딅u��eL�r}�NW��[ƴ׿��x�"���i��qk�uz�:<�2����2^�����-j��.^�|�C�=�-�d#�ljy�
���y6��]�;���9u]&��kB���[�Ax�xM�p뜶�[�	��
n��W���kB�{['4�I+�ׄ�q���K�oLl�M���xMHwo렺.��5!|\��s�L.�ׄr���i??�xd�۷eNC-ܺxD���uLk:���U>���	m�)�,^����AB��ڣ�Nawū x\���Z`���U?���9�]*rS�
B���:�� ū �\��sjnO�
"���:�FP��ī |ܹ�گF��x͈�mzgTM�UvI�f���A��rG�M7؆los����_f]�݃'�"ަ lC�s�hmrC�MA؆ \�԰�܂x���A��i����m��6��:�������Ԃmh�G	�2�����o��a�Am��ަ lC�sj@6r7�MO؆'\�Ԙl�jx���O��i��2�=a��n����[B��" ڑ	��xKH���"z1S�2{j�xK�R+L��-!��@��F�`��(r] ���vK�"ׅP���a��(r]�ԅ;���R�Ma Q�"v�K�G��y>*"����0@j�œ��MD��v0���q��0 �q����M�Fn��+q��MFn�V��� �\5�vZ�	�]ᣈ^ϴGK.v�	"�ua�Բ�\�n� rk � ��"vˈ#���f;y��>��>�ܣ�P�F�p���tr�pr�E�V�ާ�ۇ�['�#�h]�}��}����e�WMv{�>n>nԺ\�&�>��>��:��kC.b�S��Cʭs�hor{�RnRn�SS��ְ�������1�U���'l�n�%���Y�WDv�yO��]vHu�A�9�	ۻ+� �lI.:�	��� ��\'W���]ލW Ԋrܲ�˻�
pڍ�������
 ډ��󞰷��zы�����]y��w�]��)yK�?q�z.$��wA��
��5ȭ�]�Fn��vn�y��� �]��{�1�+�hנ�wA ��z�_�c�vv�yD�ˮ �}5����ȕW ԮA�>�8r� Յ�\~�i��+ j���g���uN{�h��=#��'@�������q}ظ�6b߾������7���7�����9�ԧ��C�Hm�.�ݧ����@��\��S�����z�D�@�����sP{�[��S�������֖ԧ�����B�A�)���r#z;2��0	�ݧ����H�xr�ϲ\e� �]D�U螐G.#�z!��{B�H��ڋ>n�'䑋��^Dh��E�#�z�U�{B
�>|��{�9�Sل]��	A�1�jusr-�'䑋��^$���=!��'FH�Mr5�'Ē���	n7�b�}b �VfZ9��Ub������� ��">��uI{��0���.#�T[I�GwA$�O��,� ���Z1Bj�DrC�rɵb��n<�V�� �\+F@ue�u�� ��(F�,eZI���e�Ìޚ�G��t�#��T�H!פ{F$�V���< rO��v�v�x��~��<���<���g5TrS��z�z1�jG5q�������!R�J�������C������1��1����(���.�ݘ>�[<�[�Z�ܙ>�c<�c��޷Z�s8�ӻ?��E�v�^�1�W����1U�1TcU�R���c��c���]����GB2�g�QڴZ��H%w������i+�D}$�{��^����GB<�o����&r��HH)��1V{iH.T	)��1�j/���#!��<�P�~
Z��H�(��1J�L�:v$���Jo��~:��n���r�����\?1��1�j���=�CVn!c�v8+�
~��5d�U�6n�D�{���3Z!���;���#K��xr��@�5Q{��dٵ�CP� c����?1�.2ƪkwr9���;���Ւ��GFV����%WjE<݆�K7w}���U����Wv�����'�~~�j�*Y%q�@��/i�s�j�
�y
����Q}ԫ�䢸����/�jo�p��Z�zھ�^e�����}1T���    ��+��S��P��0ja\I;HO�#�xcU�� ���b����x�ŧ���[��iI����޸�"�.�����긲"�.�d�������7����O������맧w�������?�"#�.�D��tn�\YV�������*��"�.�D��tV�<����}AJ]p�
�J���L�
��K���� w�)u	� �^���ʕaui� ������M�Y�����ڃ[-WVD�e���6��Z.WT$�%����q���J���t_�R����R"�.ӷB�eS{Ե�b���K�a���-�++b��~AV��ƭ�++��~AV���[4WVd�e���]Y�UsEET]�/�j.�U6O����t_��\˪�+%����Pz�Tm�\8Oij�4�d��I_�q�P�_��,�r����N�X���J����݇%�F�@��dѾI�mse-`��d�UioԾ��V�^n2�j�^V�\)(/-��M�ιR��
�wO�Q4�[�
�{I��ݟ��+���M�X5C�y��T�i(����s�EF���ZS�犊�rEd�3�X�s�DN��bjP%V]1Qn$W0��Z�B�$wЕ)�R2H�1%o�����ϟ^�|������O�����_�맏�GuJ�-הAn.��VXė�� ��pk�
��r[�����teE|���j~	����+��EeSg��j�ݝ�����������^?����O�.Ax��\����=jx	�����/��AZ�/��!��2�!&ܚ��"��^a5ʄ�SWX$��� �&Y�Օ���2Ȫ�YMu�Dn��bjneVU]1�X�,W0��j�6���UWZd�k� �fV���Wn$����-�ܶ���-^P��~/>��=���jjen[]Y����jfej[=��2�`U+���I��ac�U��VO2��)�B�mU}Ԍ*�z��e����T�ՓLC(��X5�
���d
B�0�jS?�m�$S��1V��m���2�`��`���%!��15�
��.	�Rp�zmUM
vg]2��`�VC��[�Un���U��[���rA��Ȫ��$$�[� �FV�v�%!�\
Y5�*��.	a�:0�i��h�uI�)7�+��[��4��]`AT��њ����m`V�r�'Ė�� ��V%��E�Z.���Z��^Ah��jhUZ}]q�0��q�n�M������c����o��;�����حu�˿ ��S#��E�R� ���R��[AV����"rq]2��`�7ns]2��[�AV]�H�����E;+y�P<����o?&��>O��O/�WuB��e��vF���=}�����?�d�kb��di>�kP�&����%854���a`^�VV$�G�Y�y�L`֍Z�2��k\b ��%�� ��AyMJP�Qɴݧ� ��@e� ����?�#X��)�|���S��J�6��7>1z�/�݈��g#F@��V��?>1j+��QB �L����mG	��#����!%�eG���<z%q�PF�����s"yKB����doI#�=s�nI�4���s%wK���?�p�6��%	bȧF�;�Y[� �|��Èş��+�-IA>�0Bz~p�$A�����$oI�8�P[�ޒ�F>�0z��[��'F8�� mKB������mI�s�Z��^�9������V"����%����x��Ae�����Ow�r�j-|�$S�:c��ڌ�MI�:m���D���Ly8
�1P{���-�4���c���X��Lm8Z�+�͟�6�����@��au���䝩����!�nX�;���&�H��ݙ�O���5���5%��i�IL��)!�\&� �ư�6��4r�� �����--+�eb�������)!�\*�P��}�ݟ���b��W�
��v1�����
��z1FڭpM۠�L�c���,Y� �\+.@vv��R��%cE,�Z���5�%'W�1T�-��V2TD���j�*��d�H(w�1ԲUfS�HP.c��ډ�SA4�h�A���&l$B�%����s��;`�XK.c�}�����-O���z�o���OO
28�g�u��a
0/ﴎ���S�jf�%��1�֘5����2N�ek�Y�Xx�u��5�Ml �\ӣ�����i��qGh���4@��Q�gg���}ko����<�yY� �5��L圎)���Q��L�D��a�p�m'M�4DD������#��4DĎۥ����c<vv�;'D���i�vr�;'D���h�vr�;'D�{�h�vr�;'D�[����bwN�"wJξ��jwNH!7J�c�i��, �I#z��|�vv�;"�mR�4m�\�΂ r��W��zwđ��h�:�ޝi�)Z�έwgA�E�p֭���YC�"�m�zw�������9:�ޝ��(BڷN�wgAy]-zl�\��q䥵 ����zw�H#�E@�vp��ez�2�a����>/۷?}���1�=�R���e�2��:�l��]�+,�>
�MO��bw���[��Y��\�.����1�v�K�e��2��:f�r��LoX�7\�ܷ�[�.��a�)�v���e��2t�:��2w���O�(��:S�nme��KB�)�����2wI��P�a���.	��0 j��\�.		��0 ��ݸM�A����D+r���q[@��)��]��=ᣈ^�L�6���%!~�Hu���.	1�0 jS�%�"�#���bo�;�E�F.�co4���G����/ϱ���1�0@h� h��" ��Dsڴ�vD��G��i��Yb��� |�H�W$rg�"�Ma �n* 7�� ��@5���]9�0 �9��m�"�!��N�M�j�� rO�����~ZS�N�V�y�o#��OO�������Ʊ�x�76�y���?=����W�&�^
n��^@�;�u��:D�2���A�g�����p˘�m*�nv����i����:5\n��n�u��pu�e@�����tou������\�����NW��[���r�NW��[ƴu�\Į	��n�Ӻf�&vM��p�6��[Ů	��n��Ѻ�5!v\��ڛj�2vMH�n��l�Ƅ��Lv�&��˷uP]��e욐=n��9�^er�&D���uN]��e�A���9���Ů�r���i��VŮ��q�Nh�aZ�
bǭۃ��˔�D�T�E�*wo�<��î��q��i�E�aWA�~[�w��-�*� �o�vf=��]��m�FP�:�U>.��	5|
��]���AB/d�y�D*�v��nˠ��*��]3�ǻy�vS�ݦ!l���9����/��vj���u�~�?��i3����6�`~pS�����m��6��:���O�^�i۰��z��J(!�zݦlC��j>Vr�M?؆\��G��u���M�Ω1Yɽ�65a�p�Sòqk�mj�64�:�-l��uKH7�D�%�V�n	��r�QD�e�K
]���떐=��v(�~�"�5a Ԛ�vKH"��P+��+�-!��@m!�����ma����j�-!�\ua��[B��#|ы�r*�����MA�	�IOCL.b7A�-��-��"vđK� ���N.b7A�4���3�"v��K� ��J�"vĐ�� ����"v���G��y�=�vv�	"�ma�Բ�\�n� ri � ��E�&�#w�P��N.b��4rw�j�sGi���������Y?��w��89�{N+Bkc�����ƭjuZ{�"n"�QB/g��J��b�����ǭ��o��*�>��>��:�U��M�}J�}H�uN�Ն\�ާ�ۇ�[�i���>��>��:����հ�i��a��	�U���O��(�4-ƭ�����'$��� ���"���� r+ Յ���'�K� ��I�b�	9�R. �n{O�!wrN��>��An��v%���'����G��i���9�N��@����� ����r+ ���Z�.�#�r��5�[� �\�@��b�.#wrN����b�m\ ѮA�f�     r� �������n�.� �qR�����ȭ\ ԮAng�8r) ��&׳wA����5���]F����G�
�{F��[G������3�K|�"zq�:֎��nI}*�>�a��o������@���FJ�h�i�0�P��K.i�)��P;�����S �!�z�ĭi�)��N{���������6��V��S��F��f>�K�v��s ����U�>b1 j�����}z�><b �."�vO�#��R������	q�1j/�h�힐D�#�z�u�{B�=|�ћ�9��,����	9�1�j-ro�'đ{��5���힐J�#���B�n��Tr�!��+��힐J�#�fmh��.$7�F[�i��.�"��3z���Vv����=bՎ� 7�� �\'FHm%�����V1Bj��w�[���&�%�.�%��P������@r�a�/ϴwD��ć��i�v41���a�:1��+���3"ɭb��|'������r1Bj#�U�c��c���mRs
_��i�P|ܳ*��}L�x�"���hu�c��c���^��
�Ǵ�ǰ��^��G�Nv���f�f1�j=~r������1�jw�k��4��0�!T���V�{�}z�����a��K4�@�*�[�>�i<�i��U*��}L�x����TV�;��/O��<)��� �a����}R���_|���3;֞�w��t��w��Լ�&����GBx������6�����Dc�z�Jn�	Q�n4�j��ȭ�#!J]��X�,��~$D�����&Gk�	)�f4F�O��~$D�[�J/��~z��.�	)�f4��i��!S7�!V[��U�CVnJc�6���V?Y�4�j��r� �ܕ�Pum�u�AH�'�Q�٣��A<�#]��&�=���n���rO������!�)��1V[K���rocյ;��~���i���j�-�##�ܜ�P�&.�Ȟn�E���E.�����*�B
 O����ۭ����2��f��62�j��s��Z�z:�����-�+j�$c�z��[iW��SI�Pm*�Ԯ�;HO##���X�v����ld҂�UlW����\����>Z�����6|��^>2�j���v��"�.�d�y�܂��"�.�d����:�������O������맧w�������?M�"#�.�D6�Km�+*��~AT�Lgޕ1u� ��X�w�DB]�o��+�EN��ɵ�4�N�S�a��Kn�]Y�U����en�]YY���ڋ)n�=��uY���=�xEEb]�/��kV^)�U��R�)��R"�.�|OR?r^aP����ڃ[�WV�ԥ����A�V�auY� �����YuY� �ݓK��+*��K�QMP���閱�_m�ҋ��x�%��[�U@����p���~ih��X������N꿸�5Vn�\Y������I5o�����/J�9���xI�bVDj�\QP/�C��*V�\)+(/����1�q�����[���>6��'w�v�e�b�6���:W��K��X�Frn�\Y�^�/ƪI�����K���X�͟D�++"��_�ղ��>WJ��k� �P��+&�U�
��P��������"���i��)n]a�U.���v��[-t�^�����~{����ӻ{��������Q����5`�[�K�����0��%�Z��"�\Ym� ����.7�ALM.�5ӓ �\��`z��|T�7K�w�N����������{����_>����"0���%����"��a5Ą��VXD�k� �F�p�
�$s-��$j\Yd���dª�+&rˍ`Ss+�:����r���P{������"���� �͢�����2�ɕ�5p����3k�3��Y;RK�� +ۿ<��=���jhej\Q����jdeV<�4�2�`�R�*�z�I��!W(���R��O2ݠ7�Ք��x�ie��FU����LA(C�X5�
��d
B�0�j�I�=�$����1TͪB��4�2�`���`�5�%!�\
.`V���I���KBD��jFr\��aV������X.���X�����rA���*�N�$�K� �&V���%!�\15�*�.	1�&p��5�&���ᒐT.��6W�\A`������n�b�e`Vc�r�'���� ��V���EZ���Z��A\�bj\UZ1\A�p�{���AU�l���O_�>��O.����O��AJ��jJ5r!\Y�0�Y�ȍpD�� ��X�V�%#�\ �Xmq�u�%#�����ōT
�7o.ڱ,cx�S�o޾�����<m�?�����m��ٛB�X�}y}���q>�521���`nM���yM`jh27%�,���&0��H܎����Әe�5,1@i�)[�� �F$ ��(���x�F|P�����U��y����4��݄.�xb�h� 湒�%������7"s7������%ď��p�J�f�=>f0�h+i�QB��t���?;�^I\n��.!=���-	t���9`��%!�|�`��1Hޒ�E>^0z��Lݒa���Jږ$�!�(A<5"kK�|�������6RD������s�$A�(����ݒq��#����%	��'	F@m%yKB�����mI�!A<{��-	�3F���:l�;�DI3"�GH�c��[R�&��P�AE?��������Ϳ�}���t���M")�0����y�4uϔ�3G��&o�����ϟ�P��n�n�2���[�H�nI�5e��Q���Z���m����pc��Y?C2���Y�06f��d��Cm@���j��ԝS��%��nC��;S��:C���Ēw�����[a]Q��;G�2z�cmM	��3�lRkoJ#����?;��,ܹ0Ɗ<r�c�6؂�;%Ē;�j�;۹�SB:����V����?%����j�
s8��"��~�Hw�u��A!��|� ���i2ɭ���J����T�deĒ�������0��prCM�X�nP��rC����ca	�*4����
c�(w�1ҲU�H�D4��A֭��B�����S��;�XK�Ac��V��`��>4�ڷJ=����TOy���6j����g�3�q��Q'�� ��N��9��(3(/�N��F��b���qZ,[#�y1�
�K7=
�/�m�f��\Om �dS �m�:��8wp^�)��o�:��8;8/���[��r1���f
p[cNqQ�)��LL�%Mp1D$�+�b�v��CD�`zѫ��<�c�Nn1R$��i�vr�<'$�˥h�vr�<'$���h�vr�<'$���h�vn�<'$�k�����yN!�Jľ���yN�WJ#z!5��u���yD�� �����,"�Iдur=��eRT�N.�gA�J���s�YF.�"�e�zĐk�b�:�����aD/���h��.�gA�B���['г �\ E@����,�#��E@����9#��U Օ�[@�a䝵g�Z�LeX�2,o�����O�>|t�rO����y���Y�(��Q�q;���2ua�p�3o�z^�4,C�c�� ��T�e��u̺��y��q��ٶ�[:/S���)���U���e��u����y���Q�(�7;��r���e��2L�:繐\7/	��0 jG���%!~�@�fr��$�K� ��Xn��$�;� �~v�U�KB��- ���]��=ᣈ���-	��0@j'�{�%!��@u�\�.	a��0 js]�-�"H#���boqK�EF���b_���Q�~~��;���@�	p6��V�.��qC�(�w7�yt��� oF��qG ����]�0 j�"�K�ED��vo��]9�0 jG:p�ECn�C�V�.� rO@� J��vɈ7��"z[3��s�	�T���C�-�xk���j����w?~z������)* �D�2���"����pux�eL{��\Ю�����1��U���:5\n��^�    Ҋ�u��:�փ�^��7�7����)���2�����\���s-c�.�s���͵�i�2��\�v�\����6�k���k�f�Ѫ�5aSw��Nh�h]皰���z��_#c�s�M5v׹&l�.��A����5a ��uN;ܘ�u�		�~k��n&w�kB��Z��u��u�		�rk�~�iU�*�Z˄�;��\��>�AB�=^��Ra�� x�m���DNrϹ
���:��O!ל� �\o�sZx�[�U�An��9�] nɹ
"���:��XO�8WA���Z'����sĎ�	��(�����U<.��A5x
��\3����2���J�7׌���:��sA�7�����o�mζ}��˯�݃'��ܦ}kþ�c*h����om��uB�]M�6����pn�z�Q�M~v��M�ֆv[��v�fs���6�o���\ln��a	�9m���ܦ%l��sjXVn��MK؆%\�Ԩl�Vs���A�Nh���r��ࣈ�y<߇VDv��%D��� �.l�nsKH ��P;���nn	A�0 jr��%��� �.l܆sK"��N[H�8��rO@��q��sK�W��"z�Q�w�Rc��[B�%���sn� rY�zbrϹ	�ȝa �n�&��� ��@5�vnϹ	�ȝa������� �\mW���� ��>���G9i���97A�,�Zՙ�sn� rg �#��� �\@5�vrϹ	���a TӨs{�-#�\�s�;�Q���q��q�=����;hwE�8�{D��A+;�S��C�=J��G{TBv�y�>n>n��#W��i��a��9��In:�S��Cʭs�����>��>��:�����9�����ɭc��gZ�y�6n6n��^F�Z��q�q�z?S����O��j�4�=!��@u�A�9�	1�R. jã�E�=!�\�@��Hn�yO�!wrN]x���{B�� ���͠���Eܣ��Դ߃��Dv#{O��qR]x�;�{B���ڹ�V���F.����\��i�Rn��wK��;� �]�V��1�6.�hנ5�wA ��{�_.c�vv5{D��� �]����A�V. j� ��wA����5���]�F.��vn={��;� �}5���b�m\ ��ZA{� q�"zo�uz��nh��-� �e��ݧ8�C��A���/����~Oj��v��� ���v��� ���-�>�a�0���H��v��u@��Wi=�>�a��aD�o����.j�)��������z�� �~����}j�>4b �~�'w��Ԉ}h� �]D�m힐F�#�vw�����b��^���=!�\>��E�|��vg�'Đ���^Dȭ힐F�#�֢!��{B(�M�����vO%��R��p��=!��&F@��3�����Eb�Q/�i��.�"w�3z��|TFv���5b�na%�� ��&FH��	r���ɥb��V�+�]�K.#���pwA,�T��Zi�V��@r�a��Lh-�.�"W�3z��m"#���a�61��_^�=�.�$��R]Y�E�L���	�&w��%w�RY��r�-�-o��̗��~� ��FJ+s�+�+� �$Z���N�Nq����W)�B�1��1�b��\�>�_<�_�Z��\�>�g<�g��mQ�Z�1E�1Dc��Q��9�����߾(i�����!N��J+v�1�1� �*���>�_<�_\���g�O�X���#!��1�`m���}$������~G�y	��1ƪ������Q.c����>2ʭc�^�:�GB<�q�Q�]g�����Ln(������}$ē��>m�����Rnc�z�Fn���rb���\?Y�
2�jո=�CU� c���Ѫ�� ��?�(��VZ�ē��J/�ڣ93v!������m�N�!�)��1V[K����rc���f�!�*�1V]�s�� ��H�P�o��?2B�md��l��*��6_���ӗ~w����O�Wv�����'�~^�5��6L�\WV���b�z��[W�����P�nnQ\QPO�Cի�ܪ��V���/�j��P��J�@z�����`��r�i�b�v��0�����[��
�>Z��+��z��4}1VKQni<݆�S����P�2��WVdԥ�����s��ʊ��t_��f?��?�^?~z���__?=����O����9�ЕQuI� �^��z�J���t_�R/�YUr�D@]�o�ҫ�EN���mr�EF]�/k����reET]�/�jw_r;�iP�����ꂃ[+WV$�e����j�Z,O7Ab]�/�jkV�\)�U��R�ڃU.WJ��e�V(�hj�6��\/WX�%����qp�ʊ���_�U�܊��"�.�d�v�d��Ȫ��Ym��f����K�Q��\V�\)R��R�Y����R"�.ӷB�S{4�F.��[F@]�/{���͕1u��v36�p��T�i(��X��6��Τ꿸�5Vn�\Y������I5o�����/
�9L�Ax��aVBV�\)(/)��'V�\)+(/�B��S}��1�q�������6���vΕu�e&c�6���:W��KP�X�wn�\Y�^�2ƪy���󔦠LCP�PuqN��b"��M1-�Y�s�D.��\���>&;���?WZd�+� ��T�6�Q�f2k�Nq;�
��rA���O�j��7�?���������0蟟����_���O?��J�^�*�ܚ^B�5��/w�AVM/a����2�iSX�t�Dd��\��^j�i��In��6��rI���Yު���;�ϯ/�����/���������K� ���pK�
�(sw��(nK]a�d�.���dB��++���e�U�LX=u�D���bj�	����H,7�+��S�GM�Ln�+-2˥e�V3+s��
��rw���ܮ��"�\aa5�2����w#�\a�`mq���5iGh�Ђ�X�����g�{Vͬ�j�+����1J��j�'�RP�\����>jJer[=�t�2�`Vc*s��I�!�ac��U��VO2�Ac��*ܶz�)e���U��ՓL?(��Pm�
���d�Af0F�{@���eJARp��ze��N)X�}uIH(w�AZ��Bn�KBP�!�jRrg]��aV��[뒐W.��X��[���r?d��*��$D��� �fU�u�%!���`zk���Vv{]�ʅ`�֦��뒐W���6�\`Al�������R�e`VS�R�'���� ��V���EWn��W��^AP� \���=jPUv}]Q�0H�QU�ꯟ�O_�>�	�R� ���R��ZAV��jV5rm]Q�0�Qո�u$�� �M���%#�\��0mq�5�%#�����y�=������m�7o.���1=�ԩ�7��8I?�����Ӌ2�N�t��-�n�߾������8� ��k0w&����&'059�{�a`^C��X��FFYAy�KPZc��`�5%1 hS);�� �f#>(��a�jr���f#8m-�a���#0�;r7��<��>1�y�$oC	��#����ԍ(!||.b���`mE	���#��),��(!t|
�Èٟ�G�$�7R�A���J�@>1zV�[��G!F@m%{KB]b1z�A�nI�"��<OrfmI��ɇ�s%mK�<|�������6RD��;���J�$"y=o��nI�8���%	��'F@m%wK��O;�p�Jޖ��!�D[�ے@>��a��Ϯ�V�R�HA>�0Bj+�[RF�t� 蹒�%eđ�=�!uK�)G��&o�����ϟ�P��*��=I�6���5Y��Lg8
�1F���v%��p�W�?�SV2[d˴���C�v�u_��G�1F�l�=uc��G�1F��Pk���Az��i�2s� �\b��閬�i��Qa�1^c�X[SB�D\����y�J�]1Vđ����\�攐J.c��F\pw��pr�C-v�;w{J'7�1Ժ�9�F�pr�#mvm�B.�V�A�v�
m�B$�R\����4��;x�X�J�c��5W�� �\/�Pum��]1TD    �k�j��
w�$�{���2a]1R���i�*i�A"�\2� �VIW��q��g�����b��%��1V}�G�b�'��1�}��Q+���r�C�[��y��TOy���6j�����yg��L[c�U1J���)�%i��f ^�i0o�4K�  /��(��j=�?n�;F�@+@/� �[��i���m
p��Qg����58��Qǥg�e��}k�I)�y ��L�ck�!)J8-S�)@hߛ�)���q��0�=�����b�7LR}qL�b� �Kм��JwN"�Kв��RwN"wKк��ZwN"7Kζ��bwN� �J�}�i��?n�F��g:�����@�"�Ƕ���YDn���r'�� ��'E@����,H#�IP�:���a�.)�N+xgA�I� ���
�Y@�F��g:����wD�[�i�:���A�)�o�\�΂8r��['�� ���=��-x�0��Z�SWvZ�;gĐ��"�i;h�2ma���#�~\���۟>}���M&���q���e��2|�:�l��������1�9�6 ��_^?��m��4_U�L+Жi6�0���y;���2�f~s�l�|^��,�n�c���V��t�e��uʶ��y�R����o�𲙏z5٩ �t^��,Cg�s�A����4�p���Br�$��� ���L�����t� �ۚ���?�5���i��=n4��ٍ�7/	��.�QD�����!Aސ��mf��:��yI� w�P]x#��KB����i��yI�"�P]x�V͋ ��k�s�B�+�ڒ1�F3�h���=s�������/ϱc���Q8����#Aތ��3@job���EAn3��Y"wˋ ��o �~E"7ˋ �\i@u?J�^yĐ� �ݮAk�A �� ڹ�NyD�[�G�T��S:l�yK���뤺ЦIP��:Ua���Z�?=}f��sZs�.�<��ݏ��~z���r~
�
@/W�j/��M�:=\n�޻����puh�eJ�VZ��NW��[����x���� ��v
���nDu*�:�2��yGn��)��q˘6P��������15~��������1m]���kB���[Ǵ6�/^B���:����kB޸x{��_c�pm�0^"���:�����xMHwp��2Ʌ�@n��9��era�&��uN���[�	��mS�eZa�&d�{�uB]�i}�*�7nz{�|ԟrv]�
�ǽ�:����m�*�Wp�?�\��r��iCN�]�*� �o뜖]ܪxD�۷uL{������q��N��ShE�*�nzmT�s2Ra�ī x\���j�rM�
����:��O!��kF�y[�4�V�%�A^#\�W��6�`~���ٶ��up�{NäU���m��uBe���x�N�'�(�F�T)%d��Ԃmh�uP�K���m��6��:���#��۔�mH�uNkt���mJ�6$�:��g��۔�mH�uL��J놷�������VoS��%�J��l�]o	��v0@j�L���-!�\@ua#��[B�+���	��uK�!w�Pk�p�-!��8ua�U�[B�& �BZ	�%���G��i/vm�����%a�T6r�%䐻� �.��E�&�#W�렧!&�� �\@��xn�	�ȕa�S�h��� ���\Z�	�Eᣈ^̔sM;����0@j�'���A��0 j]lr�	���a �r�\�n�4rs �4ڹE�&#7�N�N+b��ri��hְ�~�S��C�����	uWď�^�����nc�����ǭ�ڌr{�VnVn��=#w��)��!��9�WJ�b�S��Cʭsگ��&�>��>��:��iC+b�����ƭ��z����)��!�%�z���PBv{�>n>n�^?�[���r��r뜶� ���Rȥ\ T����B.��6�����Rȝ\��δ�u��� r@ԅ���'d���GG<Nw���{B�������F���Bn���� w���0r) ��ȭ�=!�\�@�)����ȝ�:�uږ$�!�qD�����E܃��Z�{�k��ٻ ���H��j�."�rP�����ȥ\ ԮA.g�4r) �kp�ٻ ���8��z�.�!�qD�����Eܣ�^۴G�#��=#��ǭ��5���g�����`�v���}��;�(��ݧ>�C@m�/��ݧ>�C8�������a�z�D�i�)���#z{3��'vO�Oo؇7�ڸrQ�O}؇>���G�����"@��5rU�O�؇E��W��ݧE��"8�"Bkk��r�a���h}�A�f�g�����R��aU�
�����-b�T/"��vO�$��R�ѐ{�=!�\&FH�Nns�'d������u�{B�G�0�њ��vOH"W��I���]��0r��mf�>���21Bj����]L�#�vf�����N1Bj+��.�%w�Pc�u��`�wK�0�7&��n2a7��`�wQA�q��tl���"�vH1�#���k��~y!��{ƞ��.@zJznK�gl���"�6�V�>��;��;�f�͗��~����I+J����-@zw��]�>��;����U
�,}LswsB�d"ץ�i��a�B�z�B.LS�C�P��ϭL����Hm�ߗ��LΧw���/
F�@��]Q�Ri��c��c��HoS�~}e���i�a�B�v�J�N	��/�j�j���#!����X�2�ܡ>"�u^��������r�C���h]�#!����(��A�S	��o��K���&��;�GB6�ˋ���ur��H)wz1V}����#!����XuA#��AV������-X��r�C��e���!)7{1J]�h5�COn�(�<N���M�CPn�b�����և ��0c5�G�[��rc�����!�*ב1V[�m]��rCյ;�x}Ly���SZ��Ȉ'���S�c��i"wr�:݆�K7�|������������߿�>a��;X���-`+� ��}1T�ɭ`+j�)�b�v�8������싡�Uvj[I+HO�#�wxXEl�l�<-_҆8���
��|+�^��G�ǎ\�V�����X-ԸulE=�z����(���nC�)��b�v���d++"��}AV}ک�lEED]�/�jS��S�?�~����/�/��~zz��_�>=���sС+,B��}AX�Lgu���t��J/m9M_'״u	� ����mj++���~AV��-k++�~AV����VV�e���vX ���ԉzJ� ���b���M�U��Q�ڃU�VJ��e�V(��i�v�����ȩK�am�>������K�Y������auY� ��=��meEV]�/�j�.j�[QU����$7V�[)R��R�M���R"�.ӷB�S{�b�5n�E@]�/{(,�ȝn1ui�빖[�VV���@��}��2wJ�P�a(�?`M�
�;�����X�unE�^�2�j�������/���0\��$cpY�X㸕���ґ+�^<�G�A"����2�1X�s����z��kӟzn�\Yw�^~2�j���se�`��d��n{���� ��'c�����<Oi��4�d�R���+&bɭ�
�WP�1Y����
�dr1��s���s�ER���jT%n]aX�'��������,��AX������������O�=}�c���ݿ=����������N	��2���%�9ފ��rK���V-]1�X.(W0��ZlƯb���J��rG���n3]wYd����.��V5���~}������|y�����˧��� �\]�5ʄ[RWX$��� �&�P[�ʊ sud� VM]1an-��a��+&�˅�
��T�Q�K�Eu�Ef���jfenS]a�\�.���\�[UWX�� ����v���3��eu����3�j�3���;�J���)ۿ<��=��cjZeV[])��\�<��0��m�$��p�1Xͩ�m�'��P�!��jXen[=��2a�U+    s��I� �!c��W��VO2��?Cմ*��z�ie���{a�ՓL)(C
.PVo����v[]���c����.	9�0�AUȍuI�+�AXͫB�KB\� �j^nk]���`�U��z뒐Tn��U��\���r���՚NX��uI�)�AZ�Jn�KB\��ژ"r]R˭`֦��"H-��1X����`Ah��jhU�p�$��r�Ը������
�wW�Q�����"�*��AZ��J��� ��a5��[���{�����0!��`�P���[�"�*7�AX��ƭ�� �\ Y5���.��r�Ĵ�U��d��[�����7�������uɈ'/.�`��1��r�]�E����Eө�o ��������i���E^'_�{��N��o_^����GO�wO��5�Ӊ��y�M`j|򶤓�����,G����נ� �5��	� x�G|P���pBU�'��k8b�ӎH&o>�׀� ����{wb��F$0m�wJ������J�6�9>1�y�+�ڈb�"F��V�9>�a����cMՇ����!����(!~|b�V�7���a�гjHޒ�C>1j+�[�ȇ F8�)��-	!t���y<2kK��<|����<��>IA>�0Bz
D�$"z���-IG>�0z��ݒi�3#��uK���;�p�Jږ$�!sA���-	��F���:l��ORD�7����A� ���P[Iޒ2��G@ϕ�-)#�����)�[�LW8:�7y�S���x�tG*w�V�g�I2��h4����ڔd��Qd\al��NY�T�}��^�0�j�q�%��p�c��Nޠ�K2%��0�H�MߧnL25�0�H�-g�����H�v�Kۙ0^1�x��e�LS!���
����V
u��Ɋ4r�cM6��7%�������攐M�c�٦qpw��lr�C-[!�\9I�M.c��n�e�O	��R1��n;��Dr�� ���y�J�^9YJ.c��z��
��r1�zX˖�A	"�%cU��2����H(��1ԴU�Е��1F�/�83WNHD�+�d�*g��	�Pr�� y����b��[9YK�c�u��i+'*��UcU_�1g����(W�1�}��I+'*ʝc�o�x��I��r�#=�����y��<�X~2ozҟ�A����8CUN@�%���6ZQ_�R穜���!��1G�����p��1�<9+8/9�[c�M998/5�l[#�L91w`^^,��o�3-�$� ��X��o�3(�$<@x鰇	����F��b�Ӊ�����ߛ9�E�����mg�F9AC��"����ZwN�!�aм��bwN�!7aβ��jwNH W`ĺ��rwN`#z�3�'���zwN��`�}���C��"�}��F.�"�Ƕ�K�Y�F����?wn�;���W�3m�V�΂r�A���J�Y@��F��g:+u�]�΂r�!-['��� �\zE@���%�,�#W^жur�;�ȅWt�:��a�+�ٷN+ygA�� [���sF y��aD/}�����]��䵺���$����ex�r*�q}^�o���s�{N�$W�˴�e��uL�r��LwX�;\�����w�i�0��e;h��2�a�p�n��]�+,�>
�5�d��bw���Y�ιo��]�1,��c�� ���Ԇeh�uL;1���.��a�9υ�NwI���N�JwI�ׅD�����.	���QD/v�� ��@ލr�Ua�T?����%!\@�g�\�.	9��0 �7r��$�[� ��{�eD.���F�r��r]@��*w���G��y>n6���%	"�Ua�Բ������������9t,ቈrU@����v�� ���B.oA�/��g�[�.�r]�_�h��" �D;�V�.��qE�(��6�yl��i`oF��R�D�lA�*��:ra�d��uP]h3�[R��W��۟�>[X�9���FU{�����OO?=}�U1?�9���[洗Q��v���h��J�uʷ:�ۃ���Lv0�Mh�nFu:�:�2���%���4qu��eL;��\̮S��!�1�<r)�NW��[�ԍH���:=\n�R�'���u
�:�2��˴6vM�Wo��W|s�:SBv�&��uP]��m욐;n��9m��]���:����6vM�Wp뜺.s��5!~\��c�~���kB�y['�{�im�:��$�r��Gj��ncׄ�q���
��]���m���1'w�� �\��sZw�\Ů�r�ΩT�M�*� �o��?��� |\��Zh�z�U;��$�V���e�®aWA�x[�w��-�*��o�6'�\®�r��Ω!T��*� Wo뜚A�[����mӼ[�5�kF�xCo���
���t�m8��6a۾���ׁ�6�ol7WBv��M)؆\�|���u�n�7��iC����6a�p��(��u���E��i�����6a�p����u�v�;�Nh#�h��6�`b�QBod���R�]�n����A5�wݦ"lC�s��Fn^��rS ��D��떐Bn
�v%�}�R�Ma�ӎP���[B �$ Z���n	��~�QD/f�yVFj�vK�W�R[Hna��rS �!|�vK#�P�G.b��0ra Յ;���a��p���Ĵ"vĐ�� �M+b7A �&|ы��h�Ƴ��MAn
�v8���A��0 je3r�	�Ƚa ԶOr�	�Ƚa Ժ��"v��{� �����1��0�h�E+b7A �-|������E�A.�I�v�<�}Z�}X��4������'�~joX�����r��r�6��\�ާ�ۇ�[��ϸ]�}:�}8�uL��Ҫ���q��q��{1���O��(��3��n�a��������A����{���r��r�69�\�ާ�ۇ�[��O��>��>��:�-<�#���r'�2
���'ď۸ ����5����q�(��4�7#;ג�����}\�T�6���An���<�}�=!�\�@�>Jr#{O�"�rP]xp;�{B��p�5h��=!����)����E܃�����ў��$A����5���]Dn��vr3{đK� �]�\��i�R. j��v�wA��p�5h��]Cn��vZ;{���G��i�vv={D��� �yC�g� r+ �?�\��3�ȥ�:�ϓ�{Fy�/ j1ƭh�)����mξ}����/�߃'��ݧ7��m|.��ݧ2�C>���M}�k$vK�Ok؇5��5��ݧ<�C@�VrO�O�؇C�6�#�[R��� ��-ܦv������hU�>�a�0���ZW�Os؇9|�+��:�D�m힐A.#�vK�����b��^���=!�\%FH���;�=!�\%FH�"�mm��Dr���5h��Fn#����5�{B�@|��˜��֔���E�#�v�&����Ub�T/����.&7�R��L�owA.�Q���=��wĒ���̴w������U�� ��#>��N{4Lv����UbU?2�����F1Bj�Nr�����b��&1�k�]�K.#���p{�]K.#���Њ�=#��)�whM�E�f�j�>�E
��}L�x�x��j����o?ͳ��{Xc%���i�aC�z�B�s�0�0�P�T)r������1�j̭t�1�1�H-�i��c��c�����i��c��c��Ho{�M~��=g�>���׿}Q�0i�eC�z�J.v�2�2�P�*���>�m<�m��e*��}$����^�r;�GB@�o��� Z��H�&w�1J;I���>b�=��W@s?Mce����dr����x����P�c�����>r��c��fē��GBR�|����ƭ	I��1���i��!)7�!J[�h%�COn(�j����{�� ��<�`m��
~b�d��Α%��AX������F.���rc5�����rC��<i��CR�!c����?��    �q��eQ{��L���CP�!c���J�1�>2�j�ٹ�t�/�\���=kя�s}e����}���w�V���U�zʾ�M���ĕ4��t}1R;F�UW����� �*;�*�����[���>ڻ:䲸�6���/�j�uqE݁zھ��Z�-�+j��b�p�ʸ�@=u_U�ҩ��t�/����H�2��WJd�����v�:����K�Pz��ȩ���������wy~����ӻo���������]�P��2�e:�G��ȩK�Y�2�[%WV��e�����>�M������Y�2�P����K�Q��[V�\)�T��R�A��Z�R"�.ӷB�ӒO�w���i`�%�b����V˕iui� �݈�-�++2�~AV��ϭ�++��~AV�8�sEET]�/��kV�\)R��RZ��U2WJ��e�V(�pj�m�7r�\aP����]�ܢ��"�.�d�cl�UseEX]�/�z(+�l�nYuY�빖Z7WTD�UF�ڭج�yJSM��&�?�L���;�����(Y�s�P^Vr�������o����/��9̘�x��cVFn�\YX/-c��$n�\Y+X/;cտ��m�+k�e'c��B�v�u�e'c�6���:W��KL�(m��w��(/'�B��S}�M��yJSK��%c��8'n�\aOn'��������"�\Ra�2n�\aWn'���W��@WVĕ�� ��:��+&���dS�J���n���O��?>����?��w���ׯ����:%���b/�;;D�ɳƕ��2H��%�Z��"�\Tam����0��AXM0�6�u�E������Wdy��~w�?��|~�������x��S�'Md..��d�*�+&"̝eS#LX-u�Dx��\����=jx	�����/7�AZ�/���!��2�!��Eu�E~���j~enS]a_�/��_�ZUWV���� ��Lau����2����Yeu�U���rӻ��8�e&�ՓL%(C	�?���_����V�i5�2�����K�X5�2���d
B�0ƪ���m�$S��1VM�Lm�'�~P���j^V[=�4�2�`�R�����I��!(��U��kͅ�VO2ݠ7���9ܶz�ie����r[]� �!c�&��.	a�0�iU��uI+��AVM�B�KBN�bjPZk]"ʥ�
�7W�Ѥ`a��%!��i5�*��.	a�Z0�iU��uI�,��AX�Jn�KBf���X%n]2˥`�UC��
�"�+ׁ1LӁ��`AP� \���=jPU� �$��r�ը����m`V����"�-��AX��J��� �\a5����������0 ��`P���Z�"�(WALͨF��� ����`zk�m���.�|r���	`��d��+��-n��dd�W����Q��v��	k��1I�׿�~����}����d_v�j���ӷ/��~x�#�'���'F��"���3���B���/a�5+�a�4���[�2�
�kRb�Ӛ�Ľ�00�Y�L��H܅s�5-1�i���O�5*1�i�9�^���kJb���H�)��6}6b �\Iۆ��G">�(�L��M)#E��D����݊�Ǉ"F@�3X��QB�\���$oG	�3#����!%���C�p�Jޖ� �1�ĳoHے>>��a����v��oI ~!=Or�nI� �|b�\Iޒq�##����%	���F@O�Hݒa�#��kKĐO<� �Jږ$ t�0b�g��[t2RD��9���J��� �Q�P[�ݒ��;��;�=��6)��m����_f������Q�Tq��K$�d��]��F���a�P[��53��18ϕ�]3#)�\��y�4��R���˛��(�w�<��<�=�U�\r{W�*@��f�*��}S������X��L�9��1R{O��-�t��n#�7���L�9�1�f�/�6&��s�-c��^��L���\`l3����%+C=�zI��9 ��3M�9:�1�k#wkJH&��1�d�׸{SB2������`�nN	���3F�mkwJ%w�1�b�X�SB��\����n��p[UƊHr�cmv�%y�B2�����v�y�B@���v�ς�A!�\��P�YS7(A@�+�����Z�A"�܀� �u�X� ��~.@v�M~Vn��XKn@c�y��B��"�܄�P�V�u*CED����&r�J	�J4�ڶ�j�(w�1�}��)��hr���[%���c�C=�!���'���y;����۸�?�S�yy�uN���:��030/鴎��F��i���qZ�,[��4�
�K7�c֭1g}e���)��Hc>p�%�����&|`�e�t�bcS��ޜ��?
z �rLP��M�i�go��S�S?u���"~�/E@ӶS�{(���RT_x0'{'��R�3o;�r����R�l;�s��ǽ�È�GM�ݺ;�u��ǭR��m;�w�BȝRt�vr�<'���h�vr�<'�����F;�}�a�6)��+wZ�<b�]R1m��?ς r��0��Q�Y����yD�{�i�:��A�)Z�N�gA�C��֭���Y�Fn�"�m���y�����uZ�<b��Q�o��?ς ��È�GM����?��5� �����y�"/�E@�v���ez�2�ay��Y�o���s�{N�$���Ԇeh�uL�n��LkX�5\���Ak�������e;h��2Ma��Q@�x�c�v�LWX�+\�l�Ai�0���v��ez�2��:f�r��LkX�5\�<��[�.����)υ�*wI��D�Q�V�.	���QDot�o҅7v��$���� �99r��$���� �}o�{�%!��@���.ǒ���ϱ��@����H�@����d1!P���|���S��~���,�[���p49�75��o�J?�=a�_O�wI�B��P+�r[�%y�8u���]�Gla Q>�:�%y��>����O����"A0���� ur���|a ��������~��˧o/�	у�0�h+Ƚ�"�CЅP���v�!�� ���A�l� �' �~�h��"=0��"��i��@��]���0@���m�"A0�P��D�j� �/�j%rS�d�!��}�l�s{�uI�:%\}��z�0]a}��!$��^'`}~��矞?���/_∷��F��(ZC�.�V�{{M�|���vT���S�ms��O!7��qu��mL�&����puz�mL{T��Ȯ�����1�G\�m�4\�n�R�GhM�\�nPcGh-��[���A@4�۳æ1�w�����2��]��4�>�͖#�k����u�&vM�>pp���i��]���>�YMZ�&��}B{��VƮ�3��1Bț�>J�.c������2��]����>������U<�`߶9����U<� ��9��n��G�>�M���x����j�Z����ۃ�heګ���]Ń�m�>�"���x�@��s�Pr	�����>��P!w��x���sjn��G��>��Gk`����Mhƭ�
�5{젚� !�v�=��_�e۴���atR%ׯ�R�m��}N�VMn_�e�4�����\�n��i�9�sin��-Cئ!�Ǵ{;Z��-9ئ�'Ԑ���u[^�M/�(!���jc�����`�jpT�{�m�6�>�ݙ�k�m��6E�>�-l��uKB�P{2�[�n�C�0�ig���-y�������-y�@�~���]�n���0@j�7r�%!�� �-d��N�E��P�kG�a��Y_ Յ�[�nɳ�0��;����ww(�G�z���-uv˹���pR;ȅ�rn�<d\ Tw�Nn97�N. j?��s������Dᶜ��N'�ԝ��Z�M|��� Z8�Z�M|w��{�G{�ݽ�[�M|�����>�-��fNnԤ� O���x�i��kPݺ�mWЏ�����s_ƫO�ϩY4�M羄W��k����R]}��}B�e��s��r�i�%D��fS*!��ܗ��Sv��O� ��    �R^}*�}N��L.9�e��4^��vwB�8�e��4^��vw­8�%��^���������+�h��h%�<x`�ED�~3҅'��ܓgdW��Ί$�{���
�ڍ:��ܓ'�W �
h�sO�D0^P{T�[w�ɓ�+�is�i��<�����u�*�=y��r=��&��w)��y���^�>鵐\z��A+ ��4yK�#H� �]�\{��i) �kp{�]<����vZ��l\ ѮAk>w� ��{��;{�k���]<����vr����\ ԮA.?w�8����?��~���Rn��&n��g#����b���X�pLm8�F������d��V���iFD1�^;͍�%�%ǔ�R;��\�����z�D�@���T�P���\�K!���6�ۂK!���vb�=�=���0Zz,q8�8|�H}����E����0@jrz$O"(���q!��G�@�I���M�=�Lb�T/"�B�HH0�P���*�#yA"F�JC+E��1�0#��9_���]�ɓ
1��r1z$$����
I�F���!5_C�F�\�P�^_r��C<� #���3�=�	.1�hN���C<��fD��^m%�=��&1�j����$���&��!L��R��+�C<��#��2s;�C<��#�v0�$=�	J1�hb�6�zd�"�ć���W�Ha7�G�0�P���/�*����9���6���|{��O����5���������!T;�\�>�`<�`��U
��}.�xN�"��U��e�iC��姕��e�i7 Q��W{4�]�>�]<�]��U�[��5���ݟ��o�z;���IO.v��5��5�P�cr��\��1�j���~��<�`c����:�g�h�i�Q��w����<�`7(�������>�Lc���}�3y>�8�X�֐��>���c�՞�"����1�c�g)���3yP�=�P�2�V�>�g�c�R/�h�S<��7(Q
�^��]?�
�1��~���c���=%W�O񰂇����Fn���Yc5s�-���QC��xi��S<�`!c���V?��	r�MQ{���f�)P��1X]����S<�`#c����?���d��*�r+��iʾ�٧�~�X5~pv����ۯ�~]���+V��ZWRq����H��kVM\!�C^�/�W鬢�B���dAuT_��rU\Y��^�/�j��eqEm�zپ�^�s�����}1T{��[W�ᨗZ�Q+�Jz:�e�b����xz��O!o����Vo\)=�nŷC�&iI�����z0ݦ/��o�ǯ���~}~�/�~������{������A���S��"�e�G���V������*��zZ��/Ȫ��6��zZ��/�jc�X�r����u_�Ҟ�cuʕ�3�6};�(��L�I��+���-���v3�-��'񴺵_��֞�jy�T�e������˕�#�~AV�:��rE����_Uמ���RzHݺ/Hi�)V�\)=�nӷC�����ړ\2WX�[�am��f��S�����ܢ��zX��/�j��r����Yu[� ��4j�<=e��[��P�����RzH�-� �W�*���(�LSJ�B����WU������%�rnI���1XQطJ��/�>)��0bv��J���'�m���Yo9cU�'n�\Y���r2�jdj�\Q���r2���g��9W���Qj�&V�\)�S�Jr��S}���ɽs�=���1X��Dm��4��������I'q9)nPY��/���A���O|� o�q�[�a�nE^��I
����ʨ%y��G*j��~�b���?����AL���*��<H�Mw0і-vh�b�Y�7�?�����_��o����ݿ���������Q����*,j\sU���?����AX�W�v��?�p�AX{��۞��x�©a5e�Z��M��N5ƪ���}��C������~��O���^��%�#&a�A^�0a5���JuEZ{��r�^i=�`U��_���+���jVCL�ez��(�c�j�	�M��_p�AX��L��+��k�U�+�����Ĵ	���ĂY��D��^5�2�Q��l{fA��hmq�V�,{)�^�?���y_��5���ռ��J������2ƪ�����$�bʴ�1V��L��'YS�Č�j`eV�>�җ2�e�R�*�*�I���i.w(ѩ�W��B��'YS����jFn�>�Ҙ25f��~p+�I�Ŕic��V�\��%e
��	��-�K��jXZ�^���`Ss�Њ��<� 70+ڵ�jR�����<�����R�\���YC�հ*�z�$�,X� �fV%�%yd�
a5�*�b/�#R0�jS�h%{I�VЁAL�UCkًxP��`�]{�*&�f/�Q�ը��)�I�60��U�{�-�� ��V%W�E<� ���Z�۱�Ђ�jh��T��ߞ?��<����l�Q�V��t����D��^5��[/�����|j�r���`�����=�` c�������=�в����������*����s���>|�����~E��_�����O������8�8�=�1Bf���9av�{��Äi��ФnK�Y����J%����:�y�t`�LG�Vd��1祈L��H܄�;�=�1�i�Ns����4� �8H�� O�g8 M<�6�[7^����0���U�L\9n�5�!�>��nDɓ�#��w+J@�����(yatc�Vr������N[Iې���5F��!mK����Ƈ3�]��$�7R��h��^�M��$�!�i��^gNs�$�8¤� 赒�%����C��O�nI�a�	���am֖$C�A��X[�x a�È��a���H=�0�1Bj+�[�xa"c�V��$�#e��^�A��i���P[Iޒ<�0�1�i+i[R��� �}�4kK�@8�q��w׉0����k9��h|��I����o/_^��+V+�s�$Y�p�c�Vg�nJ���l3�H�)�ݕd��Yf����m�mI�?�}�h��H��,y8ی1�f��I�,s8K�;���(��c��Qo}B6|��3�Nz{��i:sw�%g1FzO`�nMɃ	F1����c�LP�1R�1,��)y&A'� ��b`�N��*q���u
L�Ά1VO$��k���S�`�V��6{���Ay>A/�P�=�@ޠ<��c��(�1F���#=���ڠģ	r1�k+i<�}y(A,n@������0���c��M��a�D<� c���ԩ+���C-G��\�/O(����61'�ؗtc���4ož<��c����i+��͸y��i��r�%����S��)�͚�?=��3A�+�t4�h�Ǽ��>��
M�b��1o鴏��F�b��1o㴏Y���b��)oݴOY�F:�� �ޮi��43� �ޢ�Q@8
�֏��b��Ao� G�NJ1��9o����ѩCR�s)�<S�S�u@��z�@0E@�љ�Q���z)©�H��(����A�G���s�܁Zz]�t4�ٍ�<{ �"����NwN�A�J�vtr�;'�"H�h?:�ם�g�Rt����ɳB)�y�����1�@ԕ�������0"ڞ����nwg��J���]0�ݝŃ")��Anwg�8�F���c���Y<� �"���vw#(�g;�ݝ�c)�؏Akwg� �>zm��ܸc���Y<��S���� ��s� B[- �+�ݝ��:k�t��vwYްLoX^����}9���ˇ��,�9���.K���)�8i�a��p0'��]�*,S>
���� ����.K�)�9�q�;�e)�2��>f;Nr��,qX�8����I�s���Ԇ���8�ma��p��<NZ��,[X�-��Һ�%y��>��Ng��ذi�(y��H�ar��$��� ��Cr��$� X� ��%�K��4���5�wIBp�N+��j�%y �u���]��<ᣈhr������ޒ<�`
�6/���.�A_�*�y��]���0 j9�V����������    ��K�LBC��. �8nq���la�ӄ1��]��0���%Zi��Gᣈhm��D��@ތ���0@j���E<�`
�A�\�.�A_ � J�v�!�� ����V�K��-����q?��]�~�S�շ�����ׄ6��K��x���~������_��KQ�vo"��i��Mg�nHu)�:�6�}8@�g�%��qۘ�T���<\�n��ɵ�<\�n��V���puj�mJ�9Z�.W�����Z�.�V�{{�d��lyZ
�N��y���=�<w���9u]&�k�������m�&vM>�p����[Ů��
n�>��u�k�܁{�'4�I+c����!��w&6��_v�&O��}P]��e�<| ��9u]&��k��~��sr��g��6��n��G��>���iM�*>Po��6��VĮ��� !j�rF�
��]Ń�m��\î�����i�R�[�U<�`��95�
��]�3�m��fPp;�U<����15�
��]���m��~y�5�k�؁m{�}L��H�]��كݼ}P{(�ܿn����ۜ��㯟~���5�q���m	�6�>��&����m
�}N��-_�%������9�{ݖl��ڽ�zݖlS>J�:��j<Vv�-3ئ���G��u[��MA�ϩYɽ�<a��p�Sc��k�my�6=�>�-l��uK�A��N{0�V�n���0�h��i��<y`ED1S��xj��uK>�R+L��-y�@��F�`��Q] ���vKEЅPlǭa��Q]�ԅ�V�n�S�0��;������QD3�WEd��x�H�s!oI�A] � ��"v�#X� �<C.b7�4�5�ڮ�-b7�0�5pZ��V�n�1a@��"v ��GQϴWK.v��Gta�T#����M<�`�D�\�n���p��� O��K��)��kЬ_��]A?.���Ɗp��}9�>��>�FѠ����q}ڸ}B;R����K��)�%D9S_�WMv�/ק���.��ݗ�����sڳ6�"v_R�O)��i���=쾤\�Rn��5쾜\�Nn��h-�l\�6n����a�=y�@�=�����d�"�{�=y���Hu�Inb��	+ ��"�]�<� ��f�m�<� �������{� ��pڳ��FvO�A�qD;f������"�QDt5�;Ed��{�����[r-����>赐����q) ��Aޒ��R. j�����a'�kЪ�]<�`��vZ7��D܃���٫]�]��� �k���]<�`��vr=����\ ԮA�gw�4����?�[����Nn���&ZC�g�!T���_���X�pLa8�F������d�?���;s��%���t�R�Ӊ\�K���v&=��=�A� @��\�� �i��1+��=�A� 8md��=�<S��#x[�p��>��g�avU{,u8�:��/���XqL� ����=��Db�T/"��H�G�R���6�G�<�H���E���ɣ1¨Zk{$O!�ÇQ���'���HD0�Tkē��#yA$FH�"B�n���!��+���<��#�&l���!K��P[�i��!HP�F{��V��Q��0#���<��C<� #���\���!5Xr�{��b��J����%h��=�mq�X�V����L�q�@�Q�0��Ĵ��"�ćQ�W��"��F��T�H!7�G�H�V����r��\v�v�|��>c���ן�	��kVC%��ϥϩC�����}.�xN�"իZ��\n�n1i	J�t��+��+n@�穯��g������C����}.�xN�B�Q�o�����w����)jt8�mC�z�J.v�K5�S5�P�*���>�k<�k��e*��}&O&x��ԡu���ǸA��g�e����<��c�z�J�z���	�1�j�M���<��c�vkH�|��S
�1�jvq{�g�y���#����<�`c�z�F����	�q���<.����S<�`C����K�xL�>�Xm��~��,d�U4r��*h���m�6�)U�1Tg�B�)Rp�1J{���	?��	�q�5Q{���Z�)Pp�1X[Kn���1cյ�\?��
N2�j�j���3{VAJ�X��+�"����KOp}z��
��������ۯ�~]���+T���*�+�8�e�b���;�&���!/��Y��W�J'ŕ�8���b��a	�*���Q/�CիtnY\Q��^�/�j'�uqE�zɾ�=F-�+�p����H-�X���4�B��l͒.{6ȕl��-��hAXO�me+����J���V1��������w�����_��}���//�?��ӊ�9p� �^fp+���9p� �}"Mmi+����ӂ�z��*j+�G�m҂�6ʇ��VJ��o��C��f�K��亶�z �.-��9��me=��2jAV�O�v�ӓxf�B-�jkOnk[Y=�n�d�y���v�P��ӂ��u���J�!u�� ��=Y�m��x�%�%z���kOr{[a=�n��������S�Q�� 7n�[Y=�n�d��3�ne����Z�u(+�ŭ�U�O���b���S���MZ��Z�jr+���]�ۡD�S_m��˝�2~i��O`�����N���`�mne�W+/�c�S`��s�_�?|���_È�W��/�hI�Ene-���~1V�}�V����[��P���*s+e��Q6��gչ����[��P�֩����\�V��+o���G���ne=}�U��j�&n�;��(�T�1V�H%qk�
�E��4���3
�2�j'���݊�9-�ԠJ�r�bzD�H�`��Y�B�$׻��S
R2HkOv�U��������>�������������:%�-h� ��p�x+��leV�K��o�������3��η�z|�VY5��U���Փ�2�����}���C	������~��O���^��%��%^��;�hګ�����J��_���n\a=Ġ-��b�m�+�G�eV�L�p��$���j�	����^��AVM��*�+���eSs+�Z���g�������r\i=��-���Y���_�=�`/c��8s��I��������^��5�������"�����^0ƪ���E�$���1TM��*�'YfP��QjTeV<ɒ�2��%������E�$��t�1X��-�'Y�P�!��jRn<��2a��jp��I� �)c�V�[��e�����B��K�bjLZ\���fEmU_M
v\�g�`�VC���<�`���U�\	��A���*�R�$O,X� �FV���%ybA
Y5�*�.��
:0�iS�X���s
&p�՚.X�v�*��	�Jn��x`�a5�*w�x�؂�jlUry]�S20��U��u-�� ��V���E<�`��W�������a6O'X�6tV�Uө�[�"�O�AZͧF���xJAa5���.�Y���@��d�*��-n��dO*���������	���/O���tI�+������t��������IY��kH;���nO����Ͽ�����a����N�Aݛ�3;�=�0����ܕ�8�=�0�ieE�~d��1�q��zP��a6Ǽ'0m!o2���� ��L�}����� 9r<�9�0���ͥ��q�}�ŉ���k%yJ�7�9����nD��c#��w+J�?9����(y a�`��VҶ���)�D[Iې��>����:�$q5��z�`�`��.Hޒ<�0^0j+�[��&F@�s��[�xa�` �Z�ݒ���#��MdmI�1t;���4kK �|���3aoI��1��닻%�&	F@m%yK�#���J���i�A�Ы>�ݒ<�0D0�y�i[��fFm%mK�@���»z?��ޒ�G�1���J�$K�B㓼*�^~{��
U^�Z��'����#�6#wS��g�1Fj=�$K�Bc�>n    cmK���3��m@ڗdi��b�alxg�0s�jw���P�M6&�L�Io�"6ܔ�3�Nz���i��;�򉳿#��Q����#M6���7%�$������<� 7 ;�]g���c�@�L��{��=%�%H�j��/��S�x�\��6{���Ay<�.�P�Q��W���	z1F:�pM۠<��c���,Y�x(A+n@��-���+���c�j�J<��c��[4u슡zDA5�P�Q�CW�
�1�Z���b�P��1R�w"\1H�&��d;*i܊Az(A2n@�xw�c��a+���cG������ROy���6j>��� �3��LG�NV1Lq��;�c�o�ԙ*���N���h�i*FY��6N���h�9*X��M���h�s3�9���Ϳ��lG��L1�i
���Qǥ�p��38�Ѩ�R��t��28ϣQ��(�rLy:� ��eH1N��g::i8�!z��/E�N�4�=v`�FD�3]�xtv�;'���i9:�ҝ�G�R��\��ɣ^)ڎN�u��Q��G��s�(�S�p��Ӫ�9y
�(Eϣ���Y<���FD��z=:�ޝ�#6)B��A�wg� �K���;�ޝ��&)��A�wg�4�G���cp��Y<�`�"���zw�!8�b;�ޝ��aD�=���]���!� ׻�x��=�A�w��q��Z TWr�;gO#t�"��8��a�ް�����/��?}����5�R���e�2��>�'��]�+,�>
����:Nv��,[X�-��,�I�u���t����8ɥ��a��p�'��]�7,��c����˲�eZ�}�q��:wY��L]�x'��]�',�>
�Vg�����2wI80�R;��\�.Ƀ�0 j���%y �@�r���%yA@��'n��$� 8� ��<ъ�%y���{J�q���O�("ʜ�:@�4��$��� �.|"��K��/���Tr������>��B�wO#H� ���n���Q����ӷ��aB�!�� ����5��x ��i�z�E<z`EDq3]�b؀�f$>p�R����.�S ��
ȍ�"D��P�D�k��.�j%n[���la��bӺ�%{ ��#f����Ԯ˼�i��ۈ�������V���8��Ɔ�N�����/�?=�EA��I�Io�Mj7P�v]"�N��i�b���uy�:=�6��5r7�.W���ƴ�_n/�.W��ۦ�G�h��\�nP�Gh}��[���A@T4��ka#��ե��Tpۜ9B�a�%��qۘ�.���5y�@��sZ׌�Įɳn��F�q��5y����c�:Z�&�ȷ}B�P�VƮ���1BȆ�L��d��k�Ё|��u�\Ʈɳn�ӞU&��k�����u�\Ʈ�#�m��~ι]�*A�oۘFZhU�*>�n��V�5��x���=H�^�\'R��.bW���{���)�v��}N�-r�����>�}JEnaW��}��3�%�*Apo��6��������O��Sh�*;�m��)�����5{�@�m��s��v�?���s�C!��u[��MC���l����m�A��\�n����9m&4�}ݖl��cjTVZ��-5ئ�'���i�붬`�V�QB�1���T����`�bpT󱒛�m��6��>�>"��҄mj�}N��J�]��	�Ԅ����[�nK��	�1ma��[��! �#���uK<���"��i������-y��H�Pr��%� h� �5;��<�`�V�#W�[�$�-��Bn	�%O"�� ���հ[��( ��F+b���G�("��r)���E�&AЄ���!&��x�@�sr����a T㨓��M<� �v�������0�i�����c�0��?�V�n�U�("�������M<�`��]�"v"H� �Q'��x�@5���ݲ���>�����ݗ�����ל�uߕ����9m���ݗ�����jZ�/ק�{��L;�Z	�]�|\�>n�~�$W���r}Z�}N�����}I�>��>�=jC.b�%���r��6�����������1�6�V�����i��	�.����K��)�%DA�b�z�i�=y���Hm\��ݓ�\ T��&vO�C�rP;-�����sR. �On�'�!8� ��Z�'� ظ �=EIkd����("�����3��d�� Յ'��ݓ��\ �ޒk�]<� ��A���^vO#H� �u�$FprN�����c6.�h�V���� "n뿳W�����#>.@j� ���x��@��vv�#H� �]�\���i) �kp��]<��������{����G�������%�GQܼ��c�[�X�pLe8�&������D�Q������i�6C�\�K �)�����=�@S @��[�K �)��)+��=�;�mX��=�6S>���f��K��X�pLs ����U���1 j�����cy�1=b �."��HG��R{������1j7}���H�DP�F��B�l��!{�0#��9_�,����s1�j-ro{$�#x��5����<��#�z!w�G�T�N���ѕ���H�JЉP�6���$�� ��̴���"HćQ�W{��]��a�A��0��!IЉR[I�p�`�U��,��=�s	V1Bj�In�{���bԞᠵ��x A(Fue�ո�x�%>̈^�������#����,�"��I����r�{d&����, W��%�)ϷI�)|{��O���5��r��粋紋!R;��V�>�Y<�YA�/�B����9��$J��j�ɮt��,��,�X��O.u��0��0�P�i#r��\��1�j���*v�������}S�0�p�[4�@�*�[�>�i<�i��U*��}.�xN����TZ��L�I0��(~�~9���x��c	�1k�{�g�t�m���J�z��C
�1�j�M���<��c�vk��|��C
�1�j��z�g�|�s�Q�C)����<��7(Q��2��]�>���cV/���S<��C����K�xX�A�Xm��~�g$d��Nh�V�O񨂅���Fk���!�4gF+������A������������Z�)S0�1V[Kn���a#cյ�\?ų
J2�j�j���3{T�I�P��+�"����KO�|z�����������ۯ�~]���+J��*�+�8�%�6 z����䚸�fg�<_�U�|���8�e�b���	�*���Q/�CիtnY\Q��^�/�j�&�uq%�Nz���=��*�+�p���� -�X�q�<�R|;�(�꫅(�4����S����X�2#�w���t�� �MR�VǕ�C��}AV��x�=~��������x����/������~:tE����_Yj�\Q=�n�D��V�\)=�n���O�Ymr��M�%ʥE.�7ȅr�����_�j�vʕճ��~AV��ɭ�+�G�m���v3�-��'�Ⱥ�_��֞�j��zb��/��kOV�\)=�n������zy�<�e�v(Q5�W�:�s�����_Vמ܊��zL��/�j�.n�\Y=�n�d�isܚ��zV��/�jO�R���QuK� �PTV�\)=�n��4��*�����t��JO��ZK��+��]@���'n�<�%'Ӕ�韰&�5��C�����r+��*�z;���T�V�������'%�F̎x��bVDj�\Q���j2�j?U���RV���d�ҺǬƹR6����%������9W�����4n�\Y���j2�j�s{��z:�m(c�����<Oi�4e��>�J�zD�PY-�Y�s��t��b�e���bzBAH�`��Z�\�$7Е�C
N2Hk�Nq;�
�Y5���O�j��߅?�����_��o����ݿ���������QG���de�[�K������2��%�Z��zzAVYm� ����\�ALM.a5�u�̂���D1�zU�7�����ϟ������|z�����/�.����b    k|	����b��AX1��֣�2�Q&ܚ��z�A^a5Ʉ�SWV2�� ������o���ʬ��bzbAY�`��j��X�\UWZ�,X� �͢�v�֓�2�ɕ�eu����3k�3���dyA�^P�	����?_��kX�Lm�+�8�c�Y��VO�̠L3�Ԭʬ�z�%eJ�J�U�UC*���I���c��R��VO��LCcը*ܶz�%e
���U�Փ,A(S�Xm>	���d�A�~0��YUhmuYfP��Q�,���$�'H�̊Ҫ��,�ƺ$�(�� �fT!w�%yR�a5�
��.��0��UȽuIX�AXM��m�K����jbUZw]�gt`Sê���<�`w0Q[��2���_��I!���:����`ִ`%7�E<� ��[�; =�xjAa5�*��.�d�Ъ�����,`S����"T�;�h�ګU}��~?{�F�|��"j>5rk]�S

0�)�ȵu�*� �fU#��E<�` ��6c�[\��Ic�ō�\����bS7Ru�<��X��i6�.�zm�ʘ���>|����^����H�޽)ԍ��O������8�8�=21���`nM�������dnJ�Y�����"q;2����� f=���(�S���6,��`w�{Db Ўq�m>��ш
��,\En��sރ�����-/L�F`^+��P���t����4w#J�>�����[Q���T����mFɣ�#����%��@|1��u�J�p#������5$oIA���� ��$�"B��^��[�g� F@����[�xa b��ZIے�cs#��FdmI��q�#���\��n#���a��z��%�F@�/�$G�y���-I<�0�0j+�[��fF8m%oK�����mI@�l�0bŻ���D%�Al ��q�nIكg�D@�Ü�[�,[8��O�6�x����+Ty�j|�$��:c��ڌ�MI�9�����DX��,m8��1F����-�r��Ƹ����NY��	,����!�fs��,�8;�1�n���;�p�[%�H�͊%�L���21Dz�9yEA�N���=1��5%O$��d�qQ��)yA#n@v��X)ܱ+��y�c�67��;%�%(�j�ǹ�S�t�Z��V{R��?%O'��j;
s���z:A.�H�=B۠<� c��j��3	Rqr��u�J�^QV�X�X���J��b�N�1�d��%Q�1T�}�:u�P=�`c���̙+F��#-G%M\1H�&h�d=*iފAz(A1n@�xw�a��i+���c�G��Z1T'���8*��OC���v���G�W)OyY�<-Y~5z��y'g~ř���b�┷!ۧ�[(�@�x��}�|4�(,xk�Gqk}��<��O�z�� h=un�q6��X���:2�8�s�Z,�ُF��b��9o)�GcJ1��1o#��}�4#E	�
�S��s�|C�Ё{eϻP׹�Q�ԃ6,B�7��RwN@Pa�|tr�;'"��h9:�؝�4X��[��Ƀ,�َN+w���A�G�ջs����z��t�1���<��"�����,D�_P]9��,GP_�tr�;���WT���xg�0���p�c�*�Y<���"����w Ȯ�Q�L�q"�]����!m� W��xAwE@�1��,G�]�qr�;��TW�<�❳��uN]y�*�9{�YAL�I�x�e˴��5���@t�����|���I���z�'��]�/,��s�q���eY�2��>f>Nr��,wX�;��,�I�v�e�4����8��a��p��'��]�0,S��㤕��2�e��GQ�Lv:�ɮt��
�T���6U���.K�)�9���FwI�>ІP;d�\�.���0 j�7s��%y�@8����%y�@��'Z��$���G��L� 6���#%��� ��d�]�<� ����\�.ɳ�0 ���M�<�`��0q��E<� �9u��m`mI�1]@�����������/���Ď#48�(�G���L�Q6�����$a��>! W��xA@��D.n� �0�گH��v�!�� �=�-m��.pj%Ze��Da Q(�
�E<z�EDc3]�uؔ�=| 	�Iu�k�nIuy�:=\}�z�0Ea}�i������D���~������_��KT�q۠vE�i�%��qۘ����]�����mS�_U�ճ�2pu�m@��U��ouʷ��Lv��f�nDu9�:�6�=�G�d�e��4qۘ�	��]���S�mcj�dr�.W���ƴu��ŮɳnӪf�2vM:�o��6b��Ʈ����1B�gw����Ʈ�#�mT�er�&O8�}Ns��6vM@0p��v3��]��>�=X�mc�������2��]�g��>��+�2v��	Qͼ^���Ů���j�ar����>��%7��xA��sjr��g��>�e��]�#�m�>��հ�x�@��j�Z����ۃ��d�u`F*�vh�}P�B�`W���{������
v�B0oۜ&�*��]�g:z���T��ݖl���1���_?�29�kNä����m��}Be���u[N�M'�(!ژv�����mi�6��>��%����`�vp�������$a��p����u[��MI��ic����$a��pS��ъ�m��6��>��d����R�m��G	�ɴ_�M���-y��H�yDr��% H� �.l��uK�Cp�P;A�ܿn�s�0 j-n�%�!�� �.l�vKAЄD[Hka���C�("��v�k���=�<� 	������-y�@ua'��xA�^��\�n�ie �GϹE�&FP�N�N+b7��- ��8�"v ��GQ̔kM�]�n�W ���\�n�Ae �.6������0 j9F.b7�4�9�Z�q��M<�`�F�V�n�c�pѬ�M��K��)��kD���3�]?.ī6z#vq����������Am 
��ݗ�����s��g�.v_R�O)��i�Rr�/)ק���_��M쾜\�NnӞ�����q}ڸ}B�M�a�%��q���i�$��]��������A���������i��9m�I�ݓ��\ T��vO�B�rP�n�mb��)'ണ-i]�<�`���𤵱{�쁈{E��iEd��{��������FvO�B�rP]x�;�=yA�@��VvOF�rP{˭ew�0���缯Aے�c6.�hנ��x A�=��{���ծ�nfw�����5���.D�rP���nv�#H� �]�\���i) �kp��]<����vZ=���l\ �N�����x A�=��ڦ��?�]���#>n�Ԯ���=����Z��+�c��1��xt�����o�t�&5PrG{,}8�>��]nI{,}8�>p�5��=�9��O'ZM{,i8�4|��|����=�����0@j�Z�E�����0 j�[�M��,�1 j�����cY�1-b T�!ܮ�XqL�ഋ��=��b�ўk���G��;|�5�|�vc{$O!����rg{$#X���q!��G�L�L��Z�����3	21BjOBp��#y&A&F@mJ��=��<b��Nؤ��G�$�B|�u�\.�����!F��T[����!I��R{��\����!�1��!�Kp�R[ɭp�X�S��+��=�	:1�h�IZ�{�GL�Ìhuګ=�nq�0�L���$Fr�{�G�b�ԎR&���x0A-FHue!�G�\�Z�^$p��#{,A-F@mb��}.�xN�x��h?��^���:��|Mi��2����9��$������:����9�b�U�Rȅ�s��s����'��}.�xN�Bիr��\��1�j�~n��\��1Dj����ؽ�>������M!È�o�BԫTZ��\v�vq�O}իTv��\��1�j���~��<�`c�6L���>�G�c�U/S�=�3yDA9�X�DAn�    �LQp�1T�{���������[CZ��LLp��(��q����}�ɳ	�1k�����3yH�;�X�m#׿��Y�c��4r��*���m��)U0�1T��F끟�!��Ե�V?��	�q��P{�cd�m�S<�`c�����xL�B�XM�;�xX�F�X�I^r-��*�����6�O񨂏����N+���!����~��=��!�,�����DvrE<=Mϗ�������}���ݿ�����߿�իtnI\Q�Q/�C��ܚ��fG�d_�����8�%�b���;�*���I/�#�OxXeq�lyY���o`���;�%�v Q �W{�\W�ᬗ鋱Z�q+�z:���b����xz��OQo�C��no\Y=�n�dշ�ZWT����Qm�s�u���_����˧_>y~��ߞ�����sС+��ԭ���z���+���m�v(Q,-r��A��+�G�-�����>�M���T����n�\Y=�n�d��D��re����_��4�����~AT��b�ӓxVݺ/FikOV�\)=�nӷC����ڃx�r��zN��/k����re����_�U�Nn�<M����~AV]pr+���Yu[� ����%sE����_�F��j�J�!u� �=8�*�+���m�v(Q:�W;Ŗ\5WX�[�aO����S����_��Z˭�+����@�ڳ���yJ�P�i(�?aMz���+����+Xc�V�U�6�1T;������>|�o�����N2���6W�┷�ܡD�T_���7W�갷���Z���8W�欷���j�&n�\Y���~2�j���se�z���=�O�+�騷���j�&V�<��&�T�1J]��{��K��;����k��%��֓	b2Hkg�q��
�I1�ըJ���z`�Oa��)n]a=��'���X�F�~��������}�������w���������GMuJ�]P�Al/a�WL�-X� �新j��A���Zj�9ĊI.�+��e�VSK��t�e=��*c��8�[��WOP���O_���>���x�˗���x�A]�5ʄ[RWXO2�� �&�P[���Aud� VM]1=�`-��a��+����&j�����Eu��̂��jfenS]a=��.���\�[UWX�/� ����v���3��eu����3�j�3���d	A�BP�	����1�5��Uf�ՕR��v�;�(�ګR���I���c��S��VO��LCcհ�ܶz�%e
��&V�Փ,A(S�X5�
���d�A�~0��iUXm�$��4�1J��j�'YRP�ܠ�h����v[]���c����.�s
�0�AUȍuIW�AXͫB�K� �j^nk]���`�U��z�<�`��U��\��!����jM�	���$�)� �U%��%y\AamL��.�SV0kӊ�vO-X��Y��m��xh�Y5�*k z�bj\UZy]ă
p�U{ՠ�����G<`�V�����"X��AX��V�������c�г
0H�Y�ȭu�*� �FU���E<�  ���T��[��b��*Zq]����浓�CYrc�%{<���կF-��'�<���ӥS�}K�=�~�ߧ�ϟ����K�޽U�������Ͽ������<�sc2����� ��'qK2����� e9H�*�xJ ZS��`s�{<�À�wv
�Ie��9��N;ƙ��Ǽ$0�,g�}�a��y�H`��7���w�011�y��nC�#�#�׳Ҭ�(y�` b��bmE�#sF�xw����(#������$oG���#����!%�!C��^UC��9�A�P[Iޒ<�01�yMA�mIB�}A��pfmI����#���C��'#�����%�[�xa�a�V��$�8�����4wKO���@�/�$F�wᴕ�-I<�0�0�h+y[��>�X��>l��n2R� 7��^�A��A���P[Iޒ��F@���-){ᨕ�%�[�,W8;�O�6�x����+RyEj|֞$K�Fc��
��MI�-�E�Ɔwv�J�v��8�C��Yw[��g�1Fj�q�%Yqvc�ͦ�S7&YqVc���osw�ᠷH���ٙ�d��'�N���P�?�,�ݬs2(i����<�_�:C�"��,��9g�r����u
Lᖫ��#�3ƚlHwM��p�1T�9A�4y��}�P���n���3�Zlj uM���1�jO	�~�K��0�1�f��6(�MX�ȁw��/�[�2VON��밇��gh��*0w��(������N��zBA��P�����x@���H�>�ԧ2H�&x�d>*�Me�Jp��'ޝ�@+�Le�K�1�zTr�J��	>4��w�����/C�G�� 5TO(���8*sh}�ˏ����ۤ��ӳ�E���f:i����rlPo�Hs?0;�m��M��,�qg~hq�ۋ@�Ѩ�>��:�m���h�Y��ٜ�vb�v4�O���y� g?sƧaǼ}X s���	o� <�FSayi�<5�Ä(����Ɲ�i��;�L�tt�xO���b���<u���zA0E@�����<���"�����yN�C�K�ztZ�<'� ��b;:�~�����È����|��.����!G'W�s��T���G'�гxA)@ue'�гxA(E@�1�5�,F�IN9����c2)���A��g� �Jz��t%2�5�,AI�zr=�4R��\C��q��� �гxA!E@�1�5�,F��E8�c�j�9{�T@ԕ�VC��u��QK��\'��^�0,S�פ�_������/>��UNr	�,mX�6�ǔ�$W�˒�e��}�|��zY�Lu��Y��[?/K�)�)�q���e�2��>`;NZ��,UX�*|5T��=Nv�,WX�+���I���%�����q�K�eY�2��>浐\:/ɳ�0 j��[:/���0�i�5�:�%y��Ml�*�%y��>��Rg�����(y��H�g�\8/��0 �_O�yID��P�˒��%yA@u��m^�G�a�S>���OE<�`�u�͔`mI�O�("z��:���I��%����/���Ď#4F8� �� ���x�@�ru��|a Ԇ����E<����+��]�c�0�i'��J�E<��	����]ģ��QDt6���� �~$>p�R�D�k��S��m�uK����i��۠����i�kNk%�U�^'a}~��矞?���_ ⠷���;(nM�.W��ۦ�ϯh��\�n�F7���u��:�ۃ�hi����nEu)�:�6��I�e�%��qۘ�X��]�����mc�F$�:v]�N����#�*v]�N�Mi�2��]����>�u�he�<n`�#Ľ�wv���2��]�'��>��#��k�������u�\Ʈ��
n�ӌ&��]���>���-c������i+���5y�@���L+c���� !��r���2��]Ń�m��1'W��x����sZs��Į�!�ϩ!T�E�*�Ap��V@����xA��cZt�j�U<|���	5|
��]�c��ABt2�:-#v	����>��� w��x�@��sj�r�����>��P!7�k��y��4�V��=����Ǵ�Bh���`�f��M؎?��闉�^#!�~ݖlS	>J�6��*!�}ݖl�
��pmr��-9ئ��b�{ݖ#l��sڽ�zݖ#l��sZ��ۼn����1m��xݖlS�jHVZ�-3ئ|��L}�xl��u[r�M9�j�xݒ�a �J$W�[��*���F._��1U �����<��
����[��% ��F�`���A�("��v'i�%�<��6׎\�n�c�0 ���ݒ��a Tvr�����>襈�E�&F0�N;&�V�n�1Y@�'�iE�&@���"��)�ot����M<��
���"��x�@m�$��xA@��M.b7�4�8�Z�q��    M<� �6h�V�n�1g@��"v�@Ѕ�"��i�)�'��i�}��>}\M�����+��E�_�jr�/+ק����'�2v_R�O)��i瞑��}I�>��>��J�U쾜\�Nn�~;�5���q}ڸ}B{ƆV��K��)�%D;S_��|�{�}��>}�>��@�k�}Y�>��>��?�[�}I�>��>�-<��{����Z�����CN.�i��hM�<`��v�%��ݓGDܣ��i^��*"��ݓ�|\�Ԝ��ݓ��\ Ԟ�$7�{�,�������ɳR. j'#p[�=y��8�-����c6n�ZH�ew� ��{7z���u��$A�qR����ŃV. j� W��xA�@��nvO#H� ��in9����\�ӮAkgw��� �5h��.@q�"��i�vv?��G|\����v�D�r���FOnh��q�_ �r�\���i�۠���/��~���5��r;�c��1�a��F��J�c��1�a Q��h-������aD�7�U���5�����0@j���{�c��1�a T���E��$�1 j�e�M��$�1 jG�q��cI�1%b�S�!���X�pL@����=�'��Ì(q���a��G��=���M��=�g$b�T�
��=�G\b�T/"���HIp�R+�p{�#y$�%F@�Zs{$O#h���u�G� �A|�m�|�����H�E��T�H&׷�x$�%Hme&���x0A)FH�Vr�{���b��N��6��x,A)F@m%��=�	61�h����"�ćQ�W����#����;�-�!IP�RI�q�`�Y����B�q�\�Y�����-r��� �>G�5�G�@�T�0ڰZ��\>�>�|�Ѥ�������%>��v��$��}.�xN�bիr��\n�n1�j�J���r��t�!T�Pr��\��1���pK�粌紌!R{��V�>�a<�aAڈ�/v��������}S�0�p��-n �z��.v��/��/�X�*���>�g<�g��e*��}&O(�����!w���	�c��Tn��L�P0�1T;N���>��lc�R/Si}�3y.�4nP����+��}&�&���=oF�}��
�1�j�����3yT�>�X�m#׿��Q�c��4n��*����m��)Rp�1J]�h=�S<��7(Q�W��Ʈ������cd�m�S<�� c�����xX�E�X��;�xVAF�Xm-�~�Gld��Қ�xH�D�(um���O�x��|���/j�����?�Ld��r+��iھ�ۧ�~�X�~���ݿ����Ū߿bիtnI\Q�Q/�C��ܚ��fG�d_Վ�ŕ�8���b�z�Ϊ�+ds�˝�@�����h?�����Y/�c���]lE�z����������^&-�j9��c��i��6i1T�̠V��7�[�Q�)V+[)}߿Z���)���?|������|����w�������?�����K�X46�\m�+�
���҂�z��mi+ku�˨Y�csnQ[Y=�n�d�1>ܮ��z^�B-�j��R�ڊ�yu�� ���jl+�G�m҂�v���l�'�%�%��׫R�[�
�9u�� �=���m+���mԂ�6T���VV�[�Y���v��ճ�jAV]{R��iB]��O�Zo���VJ�ۤ)m�����O�DۡD��^��ar�[a=�n���b�-ne����Z��TVn�;=e�[��X���&��zV�� �=�L�r���_��/�Ԥ�I����_�b5TV�[)�)o����_�?�����'e���w��8t:�5+�ȭ��ao����$n�[Y��^ž �Uz�enem�z��kӟzn�[Y���z2�js��nE�z���=�Ϫt+�锷��Qj�&V�;�%%Ӕ�;�hv�.Ή\�VZ&x� �0�ح��OГAX;��[�VX�+�� �V▻��
z2k�NQ����y=d��;���m���_>���������p~~��/�����}�T��I$���o�������D��J�$7���3�2Hk���o��肩�jv	�����'�eVgy������������ϧ���/��!O2�� �&�P����Asd� V\1=� -��a�j�+��|�&
����%�
��z|AYi5���WXO.�� �&W����3����-p������ڐj\Y=� 0���^���_�=��.c��8���I����`���^��5�=P}՜��"���J0�A��E�$��4�1VM��-�'Y�P� ��jden<��2a�U+S��I���c�W�UO�̠L3�Ԝ*�"x�%eJ�ʊª�ڬr<�r�2�`V��.��4�1V3��\��iA�ո*�2�$O+� ��U���%yZ�Y5�
�.Ƀ
f0��IUX�Ó$�(H�LTW�դ`a7�%yLAi5�*��.��
Z0�qU��uIZ��AX�D�K�Ђ�jjUn�]�CR0�jR���"W��AL��ʚ-�D<�  w0Q]�W��.��xT�i5�*��.����������d`Vc���_���>{�&���jT5nk]ē
0ȪI�h�u�(�� �fT���E<�`�60���}�t�u���.��	�/kk��.�3
���~5jo�=�����i�.�zm
��1���}:���I>/����[6���~���>��ǻ����}�(�S�	����� ��c�� 9s�x|P��N8��r�l�y�p��A�d��1���~P%�aǼ0�d�m�a��y�`�S�+�m/J�P^+i�P�������4k#J82�0bƻ�T��5�Fꡃ��닻%����J�v�<�0i0j+�R����7�nIC�0�
��-�#�#��dAږ��y�#���3I\�����q��k%yK"L��^��%���
F@/��ݒ��#����-I<�0L0�y}��$���a�VҶ$� ����+��{p }K������doID����-���#����%eO#��^+�[R�0�I&����$Y�pV��mD9����˗W��
Қ��=I�*�M�Ɔw�*2�7%Y�pc�V��J���1�H��6�$� �c�����}I�C��i;2s���v�-b��n��4��V�!�axi;�錷?�`�xgg���E]qVc���@�֔<� c��F�q�����C��ݜ�G�b5�9r�H=��c��F���������0kJHЉ��CK
w���z&A)�X�=Dޠ<��c��	 oP�PP�1����J<��C���2���$c�4Y'��A�GcRo�H#W�C	rq�Ļ��b�\1V�%�k9*u܊�z8A4�P�Q��V�#
�1��7x�Q+��	�C�GeZ1R((��8*�����z�S=�!��g�i���a:i������Q@�lٸB��T1�젷u
��Qg�gq��98�ѨcT��:�m���h�s3��9����h̙)���M�~4Ҹ#Nx�� �8iR��Nx���	��Lv�G�IQ����LP�kI�b�?�L�tt�p��c���ѩ�Q�c�)���-u��1��,G�պs��]� ֣ӊ�9y��-=���g�N���jwN�?0K�~tr�;'�!x��8:�ޝ���R�<:�����N) �+;����F)�A�xg��O� �1h�,@�I#�򙮞�`W��x�%EH�1��,D0I�zr�;��<R��\���i����V��x�!E8�1h�,C(�E�c�*�9{ ���0"*��:�c�+�9{��!՛LrŻ,oX�7,�AE������O_>|gyͩ��wY��L{��)�I�w���t����8����a��p��'��]�2,S�����r�e��G��Lv��ɮu�%˔����8ɥa��ps'��]�6,S�c��I.t�%˔����Bn��$�8� ��MZ��$��� �=.L�s��O�("j��:[Æ3�7��S ���m�    �<~���3D.s��1k �#v�]�<� �֗�V�K� �3p��'Z��$!�� �.|���x �>��*��zب�$A0�Rˮ�Z����G���O�^b���GLa ��A���E<�������]�s�0 ��%ns���la��~E����x ���4Zk��Gᣈ�m��$��ތ<|��>���.�S �J�v�D������6P���,\���Z�?=�����V�M�u���w?~y����/��%�)�yk�mN������pu
�m@����Ѯ˽���DM3�Y6���ե��Tpۜv�K�f�%��qۘv&��]�����mc�sm�Nv]�N����p��ui�:5�6���к�u	�:�6��˴2vM�7Po������찑�m(y�@���L.c����i��e�<~���9u]&��k�������u�[Ʈ��n��+��]�'��>�=�L+c���� !��r�R�2��]����>����.v��m��ǜ\Ů�!���i�ar��g�>�fP���x���cZ���î���Oh�E�aW�؁r{��L���H��®���j���K�U<~`��9m���]�C�m�SC��+�U<����95�
��]�G��6�y�J+`��Ⴢ�>�=B�_���t��m�v���O�L�v ���\	��붤`�RpT���m��6��>��&���R�m*�}Nk����m)�6�>���q��m)�6�>��9h���`�vp�Іъ�m��6�ࣄ(d��J��]���t������\�nK���9ma#�[��)��	���uK�B0�P{��[�n�S�0�i����-y A�pD+`���?�("��r�?���ݒ�a���K�-y
�@ua#װ[�0�0��>r�%#� �.��"v#�}��ӊ�M<��
�v�2������QD3���g��x�H��r���a ��f�"v�#x� �m��"vO#x� �u��E�&F��NK1Z����a �F�Ҋ�M<�`ED=�^5���ݲG��>��A�ݗ�����נY��ﻂ~\��5�}`Inc�%���r��6��\��K��)��9�d1n�/'ק��ǴZ)��ݗ�������Ŵ&v_"�O�(!ʙ�j�װ��}��>}�>���r�/+ק���(r�/)ק����'r�/)ק��紅'wbvO�AprN+��z�=y���m���ݓ'Dܣ��i�oF��dw�{������ٖ�6vO�A�rPs�>vOE�rP{�����ɣR. �On'�'�"8� ���@ke��)@���Zv ��q����z�9t�-I<�����5�[�x��@��fv�#H� �]�\���i) �kp��]<����vZ9���l\ ��4����"�QD�6�ծ��gw�����5���.D�rP�G��={A��^�<��ݳ��|P�1nE{,y8�<os����|��m��נ�I�h����D��K+i���T�#����z��ni�eǴ�R�F"״ǒ�c�� �}�J�i���t�P�Ӊ\��!���6\����!���v���=�>S�B�j�e�4�#���O����3�0�j�4���#y�!FH������	*1B�o����	*1B�nk{$O$���=�A�m��a�a����=���Ì(s�{Z����#y�!FP�"����	*1B�����&� �������%��=��-p�X�Q����Lkp�@�L�0�JZ�{�G<�Ì�tګa�;�C<��#����%�!I0�R�w�[�C<� #�62�\���!Օ�����Օ�V��	N1�x}�@kr��Q��0#���j)�*����9����k{�9�#{w�|�{Un�'ܗ��� �3���jvAM�"�݋y�Y0�0�~�ka�����Y-z���'���o�ګ�o/�qM<^�+��=�Y�,�P�*�\��0�iC�v���=�bS1�P-����㘎1Dj�O+u����!H��V��-��7 ����6��b������7e�v��v1D�W��b�X�qL�BիTr�{,�8�m��e*��=�uc�U/S��P�c�6���	��1Fi	Һ�#!��3nPz4��4Vv�{$$������#w�GB@�s����f���H�)w�1V�O�~���r�cէ�[�	I��1���i��������m��ē[�J�ڣ�m�������~#W�� ��@�X�Yr|��Md�U�6r!|��Ud��,�>Q�.2�jki��!)��1J[Kk�A<��|��xY��,v9|�=d��T���S�#C�v��[OOS��'�}���kѯ�{}g���|�e����X���-�+� ��}1T��I��+i���b�v�8�(�����A�UNVU\!+ /����Q}�Ou�eqem`�<_���p��z��}1T���[W��K��P-ตqE@�t_U�ҩ���4m��޶/Fj��޸R"�n���{0X�q�D,݊o��ˤE.���l�_���~}~��/�~�����w�x�����OA����[���2��#WV�ԭ���z�έ�++��~AV�l��&WV��m�����S劊���_��euʕIu� �dȪ�+%B�6};�^1-�2}�\,OO����_��n�\Y�V���ڍx�r��"�n�d����z��"�n�dկA-�+*��~AT];Xs�DHݺ/Hi�.V�<M���2};�^8�G]0�5s�E@��/kwas��ʊ���_�Վ��V͕au[� �PVn�<=ed�m�b��Zj�\QUw1�j�b�
�)-5���L�C���ѯ�<���W�Fɪ�+���;��?�G�|�tn���I��3oc���m�+k�%c�����+k�m'c��>�6Ε�����1Vk!S;�z���1T���j�+e�-&c�6��;W���I�Pz���GU9���)--������✸�s�E<���Zs��ʊ�rI��#ʸ�s�E\���j^%j]YWn'���r��AWL$��� �FU������_>���������pz~�o/���~���}TQ���r=�C��bg�Yȳƕ��2H��%�Z��"�\Tam����0��AXM0�6�u�E�������,oT�_�E��ϟ�����z����/�4A���Bk�	�����0w�AL�0a����r�K����%䚺�"��Xi5���SWX���� ���p��
��r����ܦ��"��_a5�2����H/��AV���+&r��eSs+����R���rӻ�e\�2���I����wh������״�T��VWV�-c�W��VO��LAc���ܶz�%e
��&V��Փ,?(��P5�2���d�A�f0F�AUXm�$K
ʔ�������	U�m�$��t�1X���m�'Y�P�!���O!��e	B��0�j�����V.���V��X���r?dմ*�κ$䔛� �U���%!�\
�`zsUM
vo]R��`�Vc����V����V��]���r+��Ъ���$d�[� ��U���%!�\
Y5�*��.��r�4Xiv��Lo�ڣU%@O"�*��AZ��J.�� ��a5�*��.��r��ت���R�e`VS���_�~Ȟ�="�\ 5���.��r��Ԍj�ں�ɭ���V���{�"�'�AZ� F.�KFJ�����Fn�KFVyu1����~>y��Nu��/�z�ĝ�I�������O�p�N���רv<˛��w�>����q<�==1���lNF�AxM��(��޳&L�Y9���8+8�I�Nk*�"�l��g%0mV"q2����� �MK$�?���� ����{3g����� �8H�\o�x�l� ൒�%$��D|Q��\�7sո�"t|"b����nE	��C#��,��(!�|.b�V�����P[�ݐB��!F8m%oKB ����7�mI�~�0b�g�:��+����#��I��-ID>�0 z�$oI�8��P[Iޒi    ��#��L�nI�0�ч�답%	b�'Fm%mK�:|���r��̕�F���a��V��$��:���J���8�i�Ы6Hޒ�F>�0j+�[RF��� 絒�%eĐ�A��q&mI��l4>�ۈr���ח/� ��q�g�
�\�m��[�P���ݔdi�Yg��ZI��+�҇��#�ܸے,�8��1�zd�m �b�����I�?�e��iS�i;S�-7�?��2w�����1�zM���LK%�c��p�ݚ�ɕb5�p3�ޔ�L�c�r��#E2�T��fp�ڝBɅb�ؘ����G.7 Ov�K,ܳ>���B1���>F��dr�C=�&���r�C�vy�B@�a����2g�(� �\1�Hum%�^1HD���d�k�������Ϻ����b��%׋1�|T��CE8�f����R��*"�ucU�5QG�*�}c��9p�HP.c��QI�V��1ُJ:��|�K=婞�ې��˳�HO�|f7�6�l�p��i�S_�R��f�-��1�Ѩ�T� �6N���h�I*�Y�y�}�z4��F�@y��}�v4��<x��}��h�q)�x[�G]��L�~4� �S T�mS��(�2Ly� �~5�E��_����G1P�ۥ���`F1N���g>NZ�;'����b9NZ�;'�{���왮[aOv�;'��[�i;Nr�;'��;��y��ZwN#7J�~��bwN#�IP�vn�;��mR�SW��rwĐ��b::�ܝ�&�aD/{�������,� �H�|tr�;��-R��\�΂8r��G'��� �� E@�ѹ��,#�G���rwĐۣb?:�ܝ�%���왮�[;�ܝ3"�kjR]����D^V���c���ey�2�ay�[���r|������TLr��,mX�6�ǔcp��eY�2��>e>��]�/,���c�J�e��2Mᣀ����zv��,WX�+��l� ��2�e�}���:wYްLo��ُA.s�e˴�����*wYΰLg�Oy-�U�KB�- �]��*wI���"z��|�.|b7�KB�)���#�KB��/���Mr��$��[� �~=�k�%!�\@���mq��rg�ԅO�wI� ��D]�D�p���qO�(��8�_�.|bW�� ��}DnpA�/�Z���߶�?�w?�|��;��D��6���.�r] 5�mmA�-p��Zg��=a Q��DklA��!|�+��h7���E>��>���.�rS �J�v��� �Q"7�KF�.���q?��]���S�շ9�����טB���u���w?|y�������|	#
o��ho�h���[���A@ohڤ��F3p���\�
n�S�~
��]���S�mc�`r+�.W���ƴ[�ȍ�<\�nSą�ƮK�թ�)5~��ĮK��)�5v��®˽��������i�](!q����L�aׄ�q��i���E욐>.��9m��]���>�}ĭbׄ�q��iV��Ů	���m��n����kB�t{����L���.cׄ�q����2��]����>������UBn߶9����U�A.��9�Xn�
"��>����� |ܼ�j�Z�
bǝۃ��ʴG�+v�
����>�}JEnaWA��~�紡�v��˷}N�B�`WA�{���*�
vD���}L{Gk`׌�q�Mhƭ�
�5#v��� ��1��!�)�ݿn�
�i�۠���/�~���5�����m��6��>���&���2�m�}N��J._�e�4�����4�{ݖ!l��c�{;Z��-9ئ�'Ԑ���u[^�M/�(��1������m��6��>��c%���2�m�}N{gN�]�%
���������-!�\@��Dn��%���� �����[B��# �W�կ[B��|ы�׻4Ed�[B��!�Z��\�n	!�0 j�%얐E��6׎\�n	Y�0 ������}a�S��"vĐ��}��ӊ�M@n	E�b�\o.��.b7A�(��A.�"v��� ��I.b7A�6�ڮD.b7A�6�ZY�[�n�0rm��0:iE�&�!7�D�/Z�	�eᣈ^ϴG��]�n�r_ ���"v�"׆���;y�����9���T�n���TЏ�|jcE�m�sI�sJ�}N͢�-c��ɝ���c��b�.��l�9m�>��ޤU��%��)�%�n��Sg7��������A�������r�r��6����>��;����7P�����9��>���ⶰ�������1m���>��m\ цE�z�gB�{�K���Hv�L��qR;+���>"ȭ\ �\��}&$�K� �u��}�3!�\�@�nJn#�LH"wrN;j���>B�m\ Q���}&䏋�G��)��m�k٧ ����^ɽ�SDn���5�[� �\�@��f�)H#�rP���}
�ȝ\�ӮA�f��r@�k��٧ �\�=����h�`��OA���گ&׳OA����5���SG.���[��gF��������>3��}NK1ZE�/mا6�o#�㻿}��m2�׌�H�h�e�4�#zw�;p��%�%���R;���������z�D�i���T�P������K!���6��[��K!������-��D;ҌV��K�)F��>��wvW�/wا;��E����	I�
1B�r_�'������#7�{B �I���E����	��&1�Zk�'d�K��Uih��C�f�.g�װ&a7�{B�B���/rw�'����\Ino��\r�!5_C�owA.�P�^��r��]K.#��2�
�]H�#�v&���Q��aF�tڣ�dW�� ��$FP�����Hr�!��$�����^1Bj��[�]�K�#���3�����^1j��z�]H�#�&�iE�Enf�f�>�E
���3�ȅb�f���cy�1��x��~H�����u4�x�j��2�X~qL�B����u�㘂1��W)�B�X�qL�"��U�ǲ�c���u�i����fqҫ��h�ưk�c��1�b�U}}�ؽ&�>���o��MQà��c��U*��=�k�5�P�cr�{,�8�l��e*��=��mc����:�#!��4�(�p>Z�{$��[�J������	��1k��}Onc��֐��	1��1�j�K�{�#!�\=�X�^
n�{$����^����#!��;�(�2�� �xr�A���Q)�%�!(��1X��F�AL����Ѭ�*���{���m�6�d�����3n!|��Md�n�u ��B�(m-�>��r�қ��hk���!(��1X]{���CSn#c��gK��r+b�J�܊xz��/=��ӷ~�X5~�x}g���|�e����Xm�&�$������H�lnVM\!3 /��ԫ����B@^�o�xuT��rU\Y+X/�c��ܲ��6�^�/��W9�uqE=�zɾ��p�-�+j��b��o�ʸ��^�/Fj��*�������|1H�Lg�ƕ�t+�Jo��t)�N��+,��6}AX�L�=~��~����ݿ�|����w�������?�"#�n�D��tn�\Y�V������*��"�n�d��tj�\Q�V�����!V�\)T��R�}x�N�R"�nӷC��"���Z��"�n���7S�byz�խ�b��vp��ʊ̺�_����s��ʊȺ�_�U��^����[�Qu�`̕!u� �5�Xs�D<ݦo�����k�d���[�am��f�&��zi� ��>�-�++��~AV���[5WVd�m���&Өe���U��^kYus�DH�-� ����*����d�R2�e�wF��2����O��(ɕs���^2+
�V���p���~#f �V2�h=�m������Q�,�6�~�����>y�?��7�����}��gV�9:M��O����?N�}�V╵����1V�ISK�ڀz��j��U�W���:�Qj�'V1^);(ok�C��X}����    x����iVS>q��)-��?����=�[�WX�k� ��T��9�5kg�Q+�ʊ@ud��R���b"�\�15��&���(��;�ޕ-v��b�Y�7�~�����ߟ�/����ݿ��������Q���j\#K�����*5��%���"�ܨa�~nw^a�_nT��`B-��&��r�c��Y��=���?~���������{�����}	��	"̭j�W#LX=z�Dx�P����=jx	�H���/w�AZ�/�6�!�j5�!&�*��"�ܰa5ʄۥWXė� ��W�����5Ȫ�Ymz�Dn�\b�|V�^1�X�Uw0�Mk��X�ܧ���,W�1Z[����$�]�t��;�����?^��kXͫ�-�+���V�1V��-�'YS�Ì�jdej�>��2�`U+�
�I��ic��T�U�O���L)�C�Z}Ԉ*�B}��e���fT��,C(��Xm��P�d	B��0ƪiUȅzY�P� ��� ,�J�$d��� ��U�}�"	1�f0��9Uh�zIH(���ջ��hR�����R����R�\����rC�հ*�r�$D�[� �fV%��%!��
a5�*�`/	��R0�j3�h{IH+ׁAL�TC�؋ ���`z��zTLv�^Q�0H�QU�3ړ�m`V����"�-��AX��J.؋ �\a5�*�a/��rd�Ъ���=�!�\��4��X/�tr뷃�Z{�tj�f����_�V󩑫�"H)W�AXWD��KFV�����F.�KFTy�2���]ߟ�ii��Y����]:���If�.�&����k{����w��5N& �G;F��?���3��LC��-g�=�1�imE�d���D� �Mt��S��xc�3�6ӑ�	�	�{�c �N��n?��,� e?H��  �	�@��M�֍��m|���O�!1�+ǍQ�c#��M�܍(!y|rc���nE	��#����%$�n���J�v�A>�1�i+iRB�����U9�mI���0b�g��0������#��Y��-	1�C#�׉��-IG>�1 z�$oI�4����'R�$A�|��u�6kKĐ�e� ^_�-I@>��a����ca���HA~�[��V��$A�<���doI���!�@�� yKB�8���$oI#�ᴕ�-)#�|c �>i��%e�����g�y0�����,G8�O�6�z����+Vy�j|�$��>c����MI�;�m��5E���,{8ˌ1R����-����v�i_�%g�1��l�:ic�eg�q���3;&sG�j�C��F��w���#�H��`��LK(��b�����ݚ�ɍb5�9�HL�c�bCXX�SB&�N�Afs�ڝ��U���Ϯ3`
w2��"�\'�X����ݟ�ɵb��ML�
��z1�z�M�
��~1�ڏ�b��'�1�aF�%�&��!H][I�W��bq�������b��%��1V}mJ��b�'��1�|T��CED�l����Rg�*�mcU�61'�)�uc���4o� M�c��QI�V��qr��a��r%5VĒ���8u�J�˒�i��[�t4�`�`ފlS_�SG�f����1�ј�T����vc���h�CH�݉�֣��`�-���x�����hܑ)z��b��h�i)���y+� g?uP�qp�B,���:uF�r.��pڿz�|�D���p��$�F1DD�K�����U�sB�{���:�d��sB������$׺sB�����$�sB�����$W�sB� �����-w�(r����I�w�r�A�I+xgA �����Lg�� ��|EH����,"�^P}�N.xgA��棓�Y�F��"���܂w��n�"����t���F�6e����t��.�"�����t��n�"�����t��뽶 Օ�ܞ�[���"����tYR�L)W^s�~�ߗ��|���5�RҺ�e�2u�>��֜.Kĕ)��"��:�7]��+S��s�c�[�e	�2��>f=�3]��+S��c�c��eI�2��>�yn_�,%W��ۧ�Ǡ���rqe��}@XG+K�e�ʴp�zi2��&WvY�$$�{� �.|"w�KB��ڭ��tIH wrPs��tI� WrP��[�.	�F.�i?O��tI�wqD+��j�%!{��=��U�t�a#�[��=\�T>�K�%!���@m)�#]q�NnT��rC��ȕ\ �b�~��@��������K�hB#D���\Z/��-\ ь1�]����QD�E��|�@ތ�㍳ ��D"7�� �\@��r��ȅa ��N ��� ��@5��]1�0�iӦiM�@.
��}�N�Aץ��To�m�z�������W+�W��?���ܮ��>������V�/aR���I��]�����mc����s]"�N���M��|�K��)�1��/��\�����mS�]c��s]�N�hs0im��[���A@/@&;��Fp_����tpۜ9��r�K��)�1m]&לkB�����&��\��-�>��p��kB����Ǵu��sM��o������\ǵ�c�.�`��L&��\B���>��L�:ׄ�q�ϩ�2��\"���>����sM� �o���S�m:WA�|��4�B+:WA��u�'�r.��\����ABo=�u6E*�s���}P�Bn9WA������"��� �\��sڧT�sd�۷}N͠­8WA�{�Ǵa��s��K�}B�B+8WA�n{���r�A�*��\3�ǥ�6�9�J�7׌��r�>��rAn7�e�4��m�v���O?O���8����`�~p���Bs��m��6��>�Fe�ͮnK���	�#~Z��-+ئ|���6_B	����`�bpT󱒫�m��6��>�M@"7��҄mj�}N��F.^��	�Ԅ����ۻnK��	�1ma�5�[B��! ���uK���"z/��Rشv��%d��� �.l��uK� ׄPkv��-!��@�G�`��$r[ ���vKH"��N�pG�a��rQ@ԅ'�����ᣈ^̔K���]�n�rM�Ozbr�	��ma �n�&�� �\@5�Nr�	�ȥa Ԏ���� �\8mW��� ���G���� �\>������t���MAn��]�"v�K� �%���q��0 �q��E양F��AMv��s9�s:��5g֯��S9?.��5������e��i��	5�:��}.wN�(��3��j%dw��������A�'��}.+wN+��i�3r�\R�Rn��n�!��%��)��9m*5��}.'wN'���!4h5�sٸsڸ}B{Eka�KĝS�=J�M�q�u�gQ�	��>.@jØ�=�3!���@u� 7�τr) �c#�]�3!�\�@u�නτr'�4�A�c�	�6.�hwQ��gB���{ѫ���ݎ`w�τ r �_Mne�	9�V. jOɵ�SG.��A�k��$A����5���SF���vZ3�Đ۸ �]�V�>�"�AD[�{�k��٧ ���H��r�)"�rP���}
�ȥ\ ԮA�g��4r) �_����SF����[�
�gF���G�����>3�K|�"zq�>�u�nI})�>�a�������o��F5RrG�/sا9�ڄZrI�/�ا@�����v_�O� �k$nM�/�ا@pڧ���v_�Ow@�a-��v_ڰOm�0��7�u����}��>�a�T����}	�>b �^����}y�>=b �."�vO�#��R������	q�1jo�h�힐D�#�z�u�{B�=|�ћ�9_�,����	9�1�j-ro�'đ{��5���힐J�#�z�L�n��Tr�!�_���힐J�#�fmh��.$7�F[�i��.�"��3z���Vv����=b�� 7�� �\'FHm%�����V1Bj��w�[���&�%�.�%��P������@r�a�y��wD��ć��i������a�:1��+���3"ɭb���    $������r1Bj#�U���rq�Mj{��������P�e���v1Dj� ���c��1�bR�Rh��Vq�K��h�ɮt�e�4�!V��K�c�1cժ��Z�X�qL�B�I�o�����w��?�)j���!P���[��4�iC�z�J�v�eǴ�!H�L���GB&�aܠ��g>/�X��Knc�z�J�y��tr�c��Tr�{$��[���o"��GBH�v���[Cn�{$��{���9���GB>�s�Q�M)���H'���^��2��]�	���1��i��Ĕ����m����;���S#��� �\B�X�Vn|��-dU�6Z|B�d�Ҝ�>���q��;���k�>�2kw�k�CSn"c������r#c�'�>Y�J2�j��~�Ȉ*w�!ԫ�ʪ���i�ғ[>}������������_���(��W�6L�UWH�%�6 ��F�Q!�5qe�`�<_����� ��}1T�Ȅ[W�
�K��P�*'�,����싡�j]\IO�^�/Fjw��
�
�yy���2�����ہ��>Z��K��i�>e�M_��.ӹ�qeE:ݾ/�j����qeEHݺ/Ȫ��o�ǯ����~}~��/�~�����w�x�����OA���Ȫ����2��#WTd�-���z�Ϊ�+%b��}AJ����&WJ$�m�v(�\Z�2}�\(WX��-���vS#�S��Ȫ[�Yu���ʕ�u[� �����ӓ �n�c���Z-WT$�-����v���J���u_�������J�x�M��WM�Q��`���[�au��V̕1uk� ����%seEX��/�jCܸ5seEV��/�jw�R��iB]����vEeU͕!u� �i4V�<=e��m�v(�x���Zr�\aPw1�k���󔖜LSN��aM����WU��+Xc�VΕU�z;���T�V�������'%�F�@��d1+"�m��������O�o������QZ���8W��[H�Pz�T5A�s��'`o'��i�ֹ�v��j2�j7�s{��:�z��&i�6�SZ�2MCc����{���(7�AV�bV�\)�N.'��v@���H(�;�^C-v�b��J��r'���S���"�\Ma5����]����?>�����2蟞����?~��?~xu�)!�\V�5��;k\a�^.+��_B��++��ee��&��銉�rO���V3]�Wd�+�L/�^���f5�խ�������������/���ė�� �ƗpK�
�sk��nK]ae./��e­�+,���eV�L�=ueE����j�eVQ]1�[�-���[��TWL$�+�L/�ڣ&V&WՕ���2Hk�(�]u�Er���jrenY]_x#��a�`mq�Փ,/(������^��5������Զ��
Po-C��ʬ�z�ee���fUf�Փ,)(S
�PzYU5�2���d�A�n0�)U�m�$��4�1V���m�'Y�P� ��j^n[=��2a���P��I���c��U��V�ee�����B�KB>����^Z�G����X���r7�Ռ*�κ$$�� �FU!��%!�\a5�
��.	��0��U��uI,��AVM�J�KBV�bjXUZ{]b�M���Vk�L`e��%!�\im���.��r-�5-X�vĖ�� ��V�@O"H-��AXM��-�� ��Y5�*��.��r�Ը���������W�Q����_����=#"�\�5���.��r�Քj�ں��`V���{�"�*7�AX���-�KFR� ����Fk�KFFy}1�����>���h����K�^���H������'�7z�NCّ^={�ne��}����Ͽ��|��� �^��5f�=41����ܔ� �����"q;2�
�{bb ��F�Q6P���6,���	�{Db Ўq�m>��hćş�,���qpރ�����-/L���V���������vi�F��>>1z}Q�����N[Iی�Ǉ!Fm%m;J����0b�g��+�;��H=>1Bzu�["ȧ F@�1��-	Q�#��$D�,�!���,g�$#��VҶ$A����Y[� �|��Èş�g�pOF��i���&h�$"x���[� �|�a�V��$A�����$oI#�uᴕ�-	1t[����mI �l�0b�g�a+�f��fD�6���8s��� �V"��a��-I�-�}�'yT�?�������B�>wO��g�1FjmF�$��Fc�Z"�]I�6�}��}��ږd9�Yc�al��NY����6���0��lN<uc�eg�1Fzڤh���Az��i�Y��i����!�aC#�;�҉���'Ʊ���Dr��L6.��7%��k��ӟ]�nk�X�G�c���Fpw��Xr�C-v�8w{JH'W�1�jw�r���tr�Cmvsw�B:�\���vgm�B0�X�Av���6(d�K���Ϯ�U*wΦ�
b��b�U�Vja�PN.c��
!�JQ.c��z�ZV2T$���j>*��d�(W�1�rTRQ� M�c������B����g�c��4VĒk��yT�|MCE8�n����R�k����S��)�����<���̯8�Ѩ�5S�y{�}L}c��i���tڧ�G#��4���8����Fi`୛���6���;F�@@o� mG���4���j
p�G���4��[48������s���L�q4��L�\�)O������ᙆ��q�AL�I��i�HL#z�3]z�ܱ�F��q�!��Int�r�-�I�t�$r���Inu�$r�m���u�$r��<�����	!�R)�؏����	��J�aD�{��Ў���΂r� Օ'�ߝA�:)��N�wgA�L�������,H#WI�|tn�;��ER�����΂r�A�G���� �\"=��}�t������,� WH����~w��h?:�ߝqdOw���8:�ߝ3��KkP]ٹ��F�Y�p�c���e)�2�ay��� �v���|���5����e��2eᣀ^���c���e��2u�>g>��]�4,S�c�c�{�e��2��>f=��]�8,S�c�cp;�ei�2��>�yZ��,_X�/��Ǡ����e��G�ٙ찍�ns�e
�4����Br��$Ď�� ��[Lns���qk �;��e?.��c�]�@������]��ma �~�hM�<�	E�>�}c��g`oI7�R]�D�q��r_ ����5�Fn�66���.�4ri�*����]a��0�i)��n��
��˧o/�s��0 g� h��"�7��"zw3]'c؄�f$w�R�.�k�EAn
���\�.� r_ �{ȕ�"�!ׅP͡�-lA�-p����v�{� �P���KF��!|�ۚ�:��&4p���\���MZ��<�����Z�[5�u���w?|y�������%* �E�6���"����puz�mL���\Ю�����1�/�p��ui�:5�6������pu
�m@����rou�����6���up�
n���t���u��:E�6�����uy�:=�6����&vM�p��V5�V�kB����Ǵ�m�.vMH�o����VƮ	����1B�{#n�����5!sܾ탚�$��kB�����Í�e욐@.��9�^er�&$���}N]��e욐@n��1퇝�Ů��q��Mx��Ӫ�U;.�$�b�=O.v�
����>�M�$�� ~���sj�r�
B���>����]��m��>�ⶰ� �\��cډ��v��[�}B�>A�`WA�o{���r?�
��]���mT����5#~\�ms�y��v�!/��s�M!��u[��MA���lǟ���m�A��[�nK���1����m��6��>�ͮ���ے�mJ�G	�����B`w���mz�}P{oG�^���ԃ����ܼn��i	�9m��xݖ%l��sjXVn�-Kئ%��Ԩl��u[��MA�Oh�x�r��ࣈ^ʼ>(WDv��%D��� �.l��uKH ��P;��\�    n	A�0 jr�%��� �.l�
vK"��N[H+a��rO@��v�vK�W��"z1S�O�Rc�[B�%��\�n� rY�zbr�	�ȝa ��9'�� ��@5�Nn�	�ȝa������ �\mW��� ��>���L�h��.b7A�,�Z�\�n� rg �#�� �\@5�Nr�	���a TӨs��-#�\�s�;�Y��q�q�kD}�����q!��m���}.wN�(��3�Q	�e�s��s��}P;O���>��;����b)��}.)wN)��i���M�sI�sJ�}N�Ն[�>��;���Ǵ�Դ��l�9m�>����հ�%��)�%�~�>��'v�\>�>n���3!��@u� ��τr) ��V�&��C.��v\$��}&Đ;� �.�6���@n��&>h}�3!|\�=�8q\"n��gB������A�d�	1�V. j#�[�gB����Sr-���K�}�k!��}
�ȝ\��mKĐ۸ �]���>�"�AD��{�k��٧ ���H��n�)"�rP���}
�ȥ\ ԮAng��4r) �kp�٧ ���8��~�)�!�qD�-h�3#�\�=��Mk��5��}fD�����]�v_�Oq����w����$��I��������6C�\������v8=��ݗ?��8��V��K�����*��ݗ5��>����|f��E���a��0@z�o�ޒ:@o ����U��4b�1 j���]��4b�1 jn[�'��k����D�k�� r�a�7}��vO� ��3z�3��~����	1��0��rk�'��k���hȽ�Jn#�v����B�mb�T/"��vO%��P;�����	y�"1¨�<���]E�f�>������v��k����J.pwA$�M���q�w�K���$W�� �\*FH����Xr���$�����>1�h���Z�]E�f�Z�=��Hv����mb�N'&��� �\*FH��r��g��� ��A���3r��b��Fp��c��1��x�~`�����uB�x�j��2�X^qL���3�hu�Nq����W)�B�X^qL�b��$W���c�����ɥ�<㘞1�j�E�k�c��1Ec�&�Q�^�C���������a���3�8�*�V��1��C���+��=�_�/n@z�3��a��~�HH%w�1X��C�x��pr�c����=Q�c�z�J�z���r�c�7Nܾ�H�(��1T{kH�|��xr�����h�Ln7(������=�ɍcV�6r�{$�����.h�������m��d�+��T���� ��A�Pum�U�� ��?�(�0YZ|�����p�q���.�A@�����F�AL�����Zr-|��}d��֒��C�U.$c����Ç ��H�P�O��!�62Dy�[Y��4_zr��o�^Q�#?�D����/�~Y��}�֨>�0MrI\Y��狱�UNnM\Q3P/�C�cĹEqE-@�d_U�rr��Z�zɾ�}�C-�+i���b�6n�UW����A�Mv�¸Bv@^�o�+��h�F��+� �e�b�����xz��OQo�C��tno\Y�Q�����έ�++2��}AV���F{������������/������~
:t%FT��/H����R"�n����tV�\)P��ۡ�ji���ur�\a�Q���ڨ!n�\YU����ݗ�N��"�n�d��n�\Y�X���ڻ)j�<=	�~1T[;X�r�DVݺ/H�k�\��H����Pz��m�?�^���[�a�kp�ʊ���_�U�n�\YV���Z��[2WVd�m���6m�Z3WTD�-���vW.�h���[�)�0[V�<M���2};�^;�G�h�yz��[��`��ܺ��"��b��n���SZ�2ME�~�5�{�__�T��`��[9WV�(c�vR��s���ӇO
�5L�Ax��aVBV�\)(o)��'V�\)+(o�C��S}��1�q�������6���vΕ��m&c�6���:W��[P�X�wn�\YXoAc�<M��yJKP�)(c��8'V�\1N�&���¬��R"�\K�`z	�؁�I�+-2ʕd�VC*q�
��r3���S���"�\Pa����Z����_>��������ˠz~�o/���~���}TR���rW����qeEx���jz	�����-הAL���*�+&"����R�M�TLr3]�Y��K��.��V5�ս�������������/�����K� ���pK�
�(sw��(nK]a�d�.���dB��++���e�U�LX=u�D���bj�	����H,7�;��S�GM�Ln�+-2˥e�V3+s��
��rw���ܮ��"�\aa5�2�����_�0c��8S��I����wX�����f�׬�Y��VWJ�-c�V��VO���L)�C9�r���z��e����T�Փ,C(��X5�2���d	B��0ƪ�U�m�$K��1V��Bm�'Y~P���� V[=�2�2�`�R��Bk�˒�2��e��j}��`a��%!��i5�
��.	A�0�IUȝuI�+�AX�Bn�KB^� �j`no]���`�U�К�U����U��]���r���՚.X��uI*�AZ�RD�KB^��� r�]��V0kV���"H-��AXM�J��DZ���Z�V^A\�bj\UZ{]A�p�˫��AU��uD�{� �FU}��~��>{�&DJ�jJ5rk]Y�0�Y�ȵuD�� �FU���E�T. ��6�V\���r�ôō�\��t���������Yr�6�����\�vg���h:������!���}:���I>/����[>��\���������	�<�qg�030�ɉLMN�ta`�C��X��Fe�=/1@i�E�>t6 �S�6%��]�' �و�?�CX������g#8��4�� �=1�iޑ�	�������J�6��9>1z�-M݈���"F8�/�V�<>1�x���ڌBǧ >����u�J������C#����!%��A��^UC� �Q�P[�ޒ�D>1z�A�nI�"��NrfmI��ɇ�k%mK�<|�������HA>�0Bj+�[� �|�a����%	�ȧF@�/�$H#�x���-IF>�0�i+y[bȇFm%oKB �lÇ�?�[�J�t����$oIA����J�G~�J�2��-I�,�}�'yT�?�������B�
>uO��g�1j�F֦$��Bc���!�]I�0�=����씕�ٲ��1�P��gAݗd��Yb��6iOݘdy�Ya���6Ԛ�3u��&1DڏL�r���.1:l�%kgZ"qVc��X;�֔�E.7 Ov�R�cW.Vđ����\�攐J.c��F\pw��pr�C-v�;w{J'7�1�z�9�)���b���}l�
��Z1y��+�
��Jq����(������Z1�:���ݠ��z1��k+s�ʅ��r�CMV^�nP��r�C�w&ġ+)�Ec�4�3r�D4�d�A��r�\�%��ß�:n�bE,�d���<氕��1�z�9j�BED�t����2��TԼ�S��)�����<��ə_q���\���;�S�[(�D�0�N���h�Y*`�m��w���ǣQǨ\���o
�֣1��88o��lGc�L�8Opޮ)�y�9.����MS���8)����=S s�3$��e��2��&g@ʅ��q��0�=��I�r�"x�0EH��1s0�� r���I�t� r�-�I.u� r���ɭu� r��l�I+v�r�A<��V��	��V�aD/|��܎�]��		�N)B:��\�΂ r� Օ'���q�>)��N.xgA�M���ѹ�,#wI�|tZ�;b�MR��V�΂ r��0�>�uDGg�� ��"EH����,"wH����wđ�h?:���i䭵�8:���3�(ߥ� ��ߝV��1�u�b:��]�-,�� �  ׈�_������/>:�u��Mhgqv��,_X�/��c���eY�2��>f>��]�;,��c�c���e��2��>f=��]�7,��S�c�J�e	�2��>�yZ��,SX�)|�۝�N��BwY��LU��9�A�s�������Br��$��[� ��[L�s���qi �[��m�?����ie�=n�����]b�=ᣈ^�Lי6���!%D��� ��O�M�A�����\�.	Q��0 ���=E.�v$ ��]a��p�S��֖$�!��D˯�p��?ӟ^>}{	�w�!z�>
���t��a#ț� |�H�rs�"�Ma T�K��v��� ��D"��� �\@u?J��vĐ�� ��
AklA �' j %Z_���ᣈ^�L�	6���%e��;�}R�mRuK�K�թ��۠�����	�kNk%���^�L}~�×��?���_ ���m��(rK�.W���ƴυ���4\�n�R��
��]���S�m�_Z3�.�V�{{�K��N���܍�.W���活�ȍ�D\�"nS7"!����puz�mL�)Jnb�����pۘ�.s��5!{���cZӌ�Ů	���m�І����5!o\�=F���`�pm��]"���>����2vMHwp���2�e�@n��9�lcr�&��}N�Y�[Ʈ	��mS�eZ�&d�{�}B]�i]�*�7nz3�zԟrv�
�ǽ�>�5��M�*�Wp��?�\Į�r��iD�=�*� �o���]�vD�۷}L����®��q��Ohg��J�U;.�$�J�\gP���`WA�v���)�
vď��}N��Bn`׌r��i⭒�5#�����i7�p��m��6�`{����ϓ���4LZ��-1ئ�'T�Jk_���t��z�NlRBv��--ئ����{ݖl��s�{;r��-Iئ$��F�yݖ$lS�s��#n�-Iئ$��Ԩ���u[~�M?�O�!�h���`�j�QB�d�`S��uKH��R��\�n	�0 ��|�r�]a �N% ׯ[B�+�ZK�[�n	9�0�����"�5a ��J�-!}�>���L{�k���5�@.	������-!��@u�I.b7A�2��1���i��0 jw�s��MF��F'���1�0�hg�Њ�M@.
E�b�\h:�E�&� w�R�?�E�&"W�P�b���MGn��c�"v���� ����-b7A�9pjuZ�eĐK�}D���6L�\"�"�|������Tď�ވ����nc��ǝ�����r�\V�Vn��#w��%��)��9�WJ�b�KʝS��s��cn�\N�Nn���e��i��	�g��z��q�q�z=��I(!��}.wN�j��-�sY�sZ�}N[8��τr) Յ���>Rȥ\ Ԇ[q��gB
��p�y��.��@n���p���gB���{ы���Ҕ��}&ď�� ��@Ind�	)�V. ���}&��K� ��@ne�	a�R. jO���SF���9���^�)�!�qD���}
�E܃��K�`��5�[� ���H��j�)"�rP���}
�ȥ\ ԮA.g��4r) �kp�٧ ���8��z�)�!�qD���}
�Eܣ�^۴G�-��3#����گN���D���Z��+�}��>�a������o���&5PrG�/}ا>��]nI�/}ا>p�5��ݗ9����V��K�)F��f�N�M�v_ްOo �q-�v_��O} =��`oI��E�ځf�v_�O� �k��ݗE��"8�"Bkk��r�a���h}�A�f�g�g{���R��aU�
�����-b�T/"��vO�$��R�ѐ{�=!�\&FH�Nns�'d������u�{B�G�0ڱ���vOH"W�3z�3��!fv}���-b �Vfr�"�eb��na%�� ��)FH�<r��rɝb��Vr+�]K�#��J�pwA �N�0Zi�V��(r��0��:��n�a��� �\&FPmd$�����N1Bj��{�]L�#������=#�\-H��M�K�#�6��V��*�i�ی����������5�A���c�1����;�Q!�u�V1ĪW)�B�XvqL�B��$W�ǲ�cZ��^��K�ci�15c�n?�ֺ��cz��
��b������7�#v ކ1��W��b�XvqL���O}ԫTv�{,�8�a��e*��=��Mc�Ն�;�#!��8�X�2���	��1�j
r��#!��9�P����=��}c����:�#!��5nPz4��6Vv�{$d�����'w�GBH�w����F����r�c��4r|��d���6n	|��dզ��z�CRnc���Ѫ�COn7(�j�v�,�>��1�k�>1�2�j���	��rc���Z�d������6Ç ��G�Pu�I+�AH���Qڟ)�>2��=���+���2�'�"����KO����kآ_�����_��˂��_��UNnI\Q��틡��OnM\Q3P/�C�cĹEqE-@�d_U�rR��JZAz���}��*�+d�e�b�6h�UW����ہ��>�}��¸�v�^�/�j�ƭ�+� ���b����xz��/=��e:�7����[�Y�i�V�u۾ �M~��K������w������_��}���//�?�t�
���u_V/�Y=r�D>ݦo�ҋ�E.���Ur�ED��/k��s��ʊ���_��Fq�ʊ���_��n�vʕ�u[� �hH��+*�~AT{K�*��'AVݺ/Fik�Z��H����Pz���F<r�\a�S�����n�\YS������̕au[� ��܊��"�n�d�v�d����[�Qm��f���[�)��aV�\)O��ۡ�ҩ=�)�䪹�"�n��
�-��Ie�����^k�useEX�� �݋�-���e��2�k�wH����^�+�r����P�P����������'��k.�v�1��p���RP�:r�ҋ��h?H侹�V��F2k�cn�\YXo1cm�S��+�	��O�Xm�u�������ڭ��޹���~2��i�X�󔖚LSM�(uqN��b"��J�`zU��/�}��H&�AZ;���?WX$��� �FU�6���~2k/��t�E`�����'o����_>��������˘z~�o/���~���}�T���rU���֬q�Dl��bjn	����H,�;�^K-6�X1��t�Eh���jj	����,��UeVgy�����?~���������{�����}	�x	���e�Z�L�%u�E����j�	����2W�AV2a����2��&���b"�\X�`zM�5��\TWZd�;� �fV�6����2�ɕ�Uu�E~����|nW]a_n0��_�ZVח�H/7�1V[�Ym�$K���;�r����x�)�15�2�������PzY����VW����`5�2���dB��0ƪa��m�$K��1VM��m�'Y�P� ��j^j[=��2�`UӪ���I��ic�6��VO���L)�AY��Z�̞��.��t�1Xs���W���rC�ՠ*�ƺ$ĕ� ��U!w�%!�\a5�
��.	q�~0ȪyUh�uIH*7�AL��Bk�KBH�	����jM�	���$�� �U%��%!�\amL��.	��V0kӊ�v��[��Y��m�� ��Y5�*k zA\�bj\UZy]A�pӻ���AU��uD�{� �FU%��EXn��X�����w�����0!��`�P���[�"�*7�AX��ƭ�� �\ Y5���.��r�Ĵ�U��d��[��k'Mx�eɍ]\��x��bV���n��ݿ���4��O�N����}�ߧ��ϟ����K��������w�>��������������*`         �   x�}��J1��O�XM�ݶ9��R�`A/�nH���nU|z�'/�9�����R��i�jS
�8��v�10�$?E��t�sXmmk
��R�ʑ�=���Q�:��K���s���g�QmB��:���(o4�G?g�.��W�˟[�2��Bխ��uQ�6�9��\c�ㅸ�_�pU:8�}f�A����֔\4��%E��Yr�G��4M�\i\         �  x�}�An�0E��S�dH���u g$�6�n�6��ĀdR�<]� =�/֑a�
P����ߌ ��^�����	I(�=��ur%�u��
�s�����h���M	1�+��3��a}8�!�P�I��9N���*�jC�����V_�x�u��a݁���a�x�D�m"6P�������-�a[~�"I��Xw���O����w����B���"�L�Lo��ܫ����S" ��3�5��)����R�4�Ε�S+yR|ՃW�(�al�>֊#8=M{�%��B�;���^���l��%���C.-��>��>N�X��y�d�r<��7oJ�.��I������Y�E�)!|��VHK;��<��.���)ځ���`�xˬo|�Z�g#�I         8  x�]Wۭ,�	������Џ���p�q�
�Y�\]��Z���K�6٭�~�[���7e��W������Vm\�FPH�IP����[�e�R�?%�9Q�^^��ƭ� �*���4$1�-]p�B��U���D�ў��� ����2���'a=������f�l�(�Wm�:s1
牓/n_�eS�f���.�_�̷�NP21�q�-/_E�%�����-H3S�? G�f�Ʃ(�2j�4�
;&5�����̌^/�n�@��A��G�����n���tHZF
�����g&�'6�J�Ծ=Q�A��G�L�0����� �j��ɪYh�I�z֬��O�@��nZ�FvE���5>�l���w�!�z�=�S {ʱ�=��1*A�k8d��1�ډ�'tQ8:O9z6�9�Y{��z0�r�П�l˪r���M�b��H��A��T����zd�@�gyA(5��j�aewx��Y��`  �;��pMO8iĭ��}�^��.��թB�%�)lA-�F��_�2P3t0���"�@@Ch�9��ef�l	������脬�9�zї�>H�������+ϹZoZ��	Z[I�����[��Q-��A�ei�I�[���i4>yVE�ݡi�#�-'}�}�BU� 9���x�Nr�:@�ڲ�<��vmf�צ1��+,0�m#}��xMe%3���igۑ+V�ﴬ��姠��j�Z�	Ĝ��9}AVCX��{|q~�!�G�=K��6'(`+ar`��f=�ӗ+%'��(w����E����E�]@	>�[�b�"�?���`��J�B�?cC��RJz�6 �j�-�gM�h��?�Z���G=SM}[>��*Y4m��]�i2��^�!n�Y���5�7ƹ7��k�� ��y@�\"�&�Xk�e�Q��S�$����5bz?hѪ����6�>b��V]1������Z�\��Z����8a*G�g{��	ZolZ7Ē��B�.M�0-���_�xy�T��z�ȕ0)�G��;(~`~����7g"�)���@Q�a�[j-�����0%��h�������Qeh�Y-ۓ�UYaZ��aQ���	��/Y�"X���A�G*���
����'�������Z��T{�q��Wb�8�k�C"`�o`�~Ik��O�9�Gd-?�0@��^P\�<?zro�N����v�>y���7  ?�F�kv��zm ��0"^7<}�x,����
�ܐ��^%n�a4n���z��[�Im��F�ՕΦ���$PN�푖)_��Wj�pw�K����n�{�(�ԶZ���L6{cԝo4���:�D��9����
̙[��:�!9�Y땝5�K���B�=<���X;�·P�������^\Ù<t�ރ�鰟�	�)��s`�q�FP�nQG2G�3���il�s:n�F<3���J5k�����V6���n�qX�l��潿Zx��Ö��sHGo�_P�8E�ѳ�y��#~ի� R����=o�,�4��I�)䷼�Z�tmQ�\gf�ʯ+*�����wbmn�gÅ�5�4�\�ø4v����������:u��     