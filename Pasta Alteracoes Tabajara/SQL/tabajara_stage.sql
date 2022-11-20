PGDMP     4                
    z            tabajara_stage    14.5    14.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24598    tabajara_stage    DATABASE     n   CREATE DATABASE tabajara_stage WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE tabajara_stage;
                postgres    false            �            1259    24747    cliente    TABLE     |  CREATE TABLE public.cliente (
    id_cli character varying(40) NOT NULL,
    cpf character varying(50),
    nome character varying(50),
    data_nascimento date,
    data_cadastro date,
    sexo character varying(50),
    numero integer,
    estado character varying(19),
    municipio character varying(5),
    logradouro character varying(5),
    bairro character varying(5)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    24776    estoque    TABLE     �   CREATE TABLE public.estoque (
    id_est character varying(40) NOT NULL,
    sku character varying(6),
    quantidade integer
);
    DROP TABLE public.estoque;
       public         heap    postgres    false            �            1259    24732    funcionario    TABLE     d   CREATE TABLE public.funcionario (
    matricula integer NOT NULL,
    nome character varying(50)
);
    DROP TABLE public.funcionario;
       public         heap    postgres    false            �            1259    24715    produto    TABLE     �   CREATE TABLE public.produto (
    sku character varying(50) NOT NULL,
    modelo character varying(50),
    marca character varying(50),
    preco numeric(6,2),
    descricao character varying(26),
    nome character varying(21)
);
    DROP TABLE public.produto;
       public         heap    postgres    false            �            1259    24781    venda    TABLE     $  CREATE TABLE public.venda (
    codvenda integer NOT NULL,
    dt_venda date,
    hora_venda character varying(50),
    qtd integer,
    desconto character varying(2),
    id_cli character varying(40),
    id_est character varying(40),
    matricula integer,
    sku character varying(50)
);
    DROP TABLE public.venda;
       public         heap    postgres    false                      0    24747    cliente 
   TABLE DATA           �   COPY public.cliente (id_cli, cpf, nome, data_nascimento, data_cadastro, sexo, numero, estado, municipio, logradouro, bairro) FROM stdin;
    public          postgres    false    211   �                 0    24776    estoque 
   TABLE DATA           :   COPY public.estoque (id_est, sku, quantidade) FROM stdin;
    public          postgres    false    212   �8                 0    24732    funcionario 
   TABLE DATA           6   COPY public.funcionario (matricula, nome) FROM stdin;
    public          postgres    false    210   =9                 0    24715    produto 
   TABLE DATA           M   COPY public.produto (sku, modelo, marca, preco, descricao, nome) FROM stdin;
    public          postgres    false    209   �9                 0    24781    venda 
   TABLE DATA           n   COPY public.venda (codvenda, dt_venda, hora_venda, qtd, desconto, id_cli, id_est, matricula, sku) FROM stdin;
    public          postgres    false    213   K;       p           2606    24751    cliente cliente_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cli);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    211            r           2606    24780    estoque estoque_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (id_est);
 >   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_pkey;
       public            postgres    false    212            n           2606    24736    funcionario funcionario_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (matricula);
 F   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_pkey;
       public            postgres    false    210            l           2606    24719    produto produto_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (sku);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public            postgres    false    209            t           2606    24785    venda venda_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (codvenda);
 :   ALTER TABLE ONLY public.venda DROP CONSTRAINT venda_pkey;
       public            postgres    false    213            u           2606    24786    venda venda_id_cli_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_id_cli_fkey FOREIGN KEY (id_cli) REFERENCES public.cliente(id_cli);
 A   ALTER TABLE ONLY public.venda DROP CONSTRAINT venda_id_cli_fkey;
       public          postgres    false    213    211    3184            v           2606    24791    venda venda_id_est_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_id_est_fkey FOREIGN KEY (id_est) REFERENCES public.estoque(id_est);
 A   ALTER TABLE ONLY public.venda DROP CONSTRAINT venda_id_est_fkey;
       public          postgres    false    212    3186    213            w           2606    24796    venda venda_matricula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_matricula_fkey FOREIGN KEY (matricula) REFERENCES public.funcionario(matricula);
 D   ALTER TABLE ONLY public.venda DROP CONSTRAINT venda_matricula_fkey;
       public          postgres    false    3182    210    213            x           2606    24801    venda venda_sku_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_sku_fkey FOREIGN KEY (sku) REFERENCES public.produto(sku);
 >   ALTER TABLE ONLY public.venda DROP CONSTRAINT venda_sku_fkey;
       public          postgres    false    3180    213    209                  x��|�r�H�����U��������*��F�Uٽv7D����L����uE��� �T)	ʬ��ښ��p?~���F�Č���0儖�U����#L��w�`�������?�����9�^UB�υ�����~�������%�MŵЎ˔�^����{��0E�������`��U�|�;���u�������ҡ*:_q㕑^:m���oC�qpߧDK���`N��3l�_�w�{���C���e�3V)Õ��;+�������bL�'��%���\U�W��!�Cw���ZoUW�+������؅!�.�~�e�78�:���vO޶�z����W)��Ch�僯��p��\��2�i膰{s�1L�e~&��A������26��*�/`�UN���~z�6}�JwZNV?�%X$}��i�����}h\�^!Ҙ�V��kn�N���t��7�g�y	��<�z��qq�����8���y!cZ^���0=�.�t}M�
 ��l8~��KpM/����.�mÓ��Hi4���=�=�������`4�`�^hFO�2������0*���	VYY�L�-~��}84}׶��"��o;�"�~���9%�o��V�2����ɫ��>�����f.g���8����>c�IN��8$�a��j\��1v����6G�"��8��y�(�9e����i�m}lΥ&��ꦑ0�I��?�/&=�ޤ/}6�{�}��C��*�!�Ct9���������y}��P1(T���5"���� N�a.%c��s\s�(#a�۰�݋)4��P��Crf^UZo�l��}@�	ǵ�N!�����a���ܜ5�Ͼ���5�T}��9{9o����)���B�7aw1��~�J>R��S>JB)�eq2Q�X�J
����?�r�Uh.���!���p'�V�����b/1Q���yN�n��n�VZ�HAx���5��e�k�%�3�ܔ��K�o�h|Dm�Պs�~��pH��ȱ~��q�8�o�Ϲ��nD�һ�m�E)�ꇛ����zJX�L�H�f�� �zE�3��J��o+��^P2V������.�>�/�"�7�@tg���p�[ԧn:g8��՞���y��U����|��C��� �� �dAU8�Ϝ�a�[I����0hj�������}_�X�2#'TC��߁t��\���HW��h�/P���C,����06Ty��!x:x�0�i�ת5\��H��R�����K��n�R�z7G��*�r+?�X7���GJ��u�T���
C*iTߵʖ�PE�kbV�/)�D�l�NŊYč�a8������a���"@)�BWu> ��dEe�Z�-��q����]�OSq��a(����/�y��8@8nil�\Z� �-������K$�\��Z���'v��g24ւ��Okf��9]�r���>)��2�<"Ÿ�gA����D�0@(�{���~��ߏ������bN @���_���o�8t��jc���z��������9��\9���+����:��M%C�NXC�l��M��t=e���ͩIbo��h���0:g#�FmCr2��|'6ݾ�[�.��=��[d�e
ӟ�}�Z�rg�VT�?'��^�˷ps:L�ǯ_��ũ!3]�v�����Z�=HU�f���	���3�%z�g����\���)���(
��vG�vYS�5��7��%u������ � �(�$ǒ�r-�|o����ѺN	9cX=r����a�G���T4���۫9$
�*�2�PvFC�N�]O\MeN��x��3�F#>j+�[�
�츄c���0M'ܖ�% ]"�* �f��I�"8w/PЀQ�?�-���>	E���+gg�����6|����-�L�0��BY\x��w��]��<��^`�=|��!Y�1A&����I�%���(i\�{<R�e�Z���**c�?�gD�sb!�xi9�J�҈;_�����p�5��\�sE�s"�n%�0?��rm��}J�
C "��bؽ���Á<S��B��$OT�����%ԫ�Q\8�I	R�[�ݓ�o�iH_RN|���R/�Z��E/�E���R�����| ^�R���i�E�J����}o���IR���@XV}�����~�2�Q~�����\�E��3ޞ�؈8O�EX�+V]��uq�����T"��ɻ�a܊F��eVy����v/!��C֙�?�re�lE��Ǆ��mD*�>d����>�"��|ʅ�Tc��A�Y ���uh�O��)8��^w}�&�ݛ�_���җ��bg��w��
ʥ�� kDI�H���� ��&�s8�Sɰ�+���3�
j�Ħb��ʃ1�\D�º�!��{�&�]�tNa'����Gـ�HR.����݇ͅ�Ȫ����9$��,3��4T�GXr�x�;6 �_���>;���+�J��}�>S�L�lHI��$n�\Md�c�����8��eQA��,�lB�Vz���A0�H.��h�����,Z�<	���RηTH:�BŘB!A�KY}耖�p �������,��uNz(7	��A�q8��W�����>~N	����-{Ui�,AK���@a��5�\���v>��=	9[��S�_7F��v�P,w��d-��?������ _j�+��}S���
p9�Bf)�,G����!>{`�y:d%g�����"\o��- ʍ�,Zy�� ��|�3ǜ�-|�o��X" ��KT4\�K#�D�C��^)�~�@��d���\d�2�uE�Y�CD���J��0R����i��Y�<�1ԠC�%	�gFj�w��xs�>��4nJ�<	�s �OK|�
%��5�r빂@�?�(s��bDyB�:��K�{������$����R8����eE�M7��4���+~��LA�c��	�[��I�
J��F失	�cC��+�O�1O��'w�ϖ��lTu��,�H��+�f���nÐ�d�=B�b=����2�����Y!$�q������/$��i�Z#y)0Jl�5�� �M�Di�@v$"H���C���Ϋ3��ڄ:��ڴ� =Ǚ~]B��]��[�*��h����M��g�l#if�Z��܆Ѻ��O����q_���UOL��҅�2XL�*j}K4�ݱ+�z��L����7+K������>��O��_+� ���#�1�N�R��u�1�|��!b�w�T��5���x��Z��S��Rg�|���B`�y4�s^" ����<��K�<�Ĺ\m�s�,6��=�����_�w�	r~�ً�����]�j���ਮ��d�'{��:AϮ(l�`T�E~oklB@�3��80��������8����n�Q�Fgj�X�T<H'Vmx�ȗ�	K����S��N�*بG2�����f$i��c�类��v�r�.:F��k�%R/�))�b-�!�� C`

���
��g�_;颴��#7+��V6mSq;�ڀ��{ 1�3�a8���b�F����� s�R���P��0z�݇��w����ʹ#�4��U��\�:D��z����w��NDp�Nn�B���������lV�M^5D�1k�w FƢ�HɾK+��aan������Јh+$-j	m �C�C���7CfW����� !',n��[��d�D�ƅ�y�ZzF.�!{41s�&\��(�y`�1������gps���Vp˓��F+��#�ц���$�%Q���K�dT[�s��)i~�;Z^׭k*�iB	ɂ��"Q���Mh�y��L��2[-��I�Ѷ$���@M"T�Z��.���݌��SjQ�s�\}��CPy7��l����X2�1�>@���)ܖA"���Ԙ������Ag��@A甤�z`����=��1����%f\������&!�i�,��nhpd�}:6MN%�O��ħ.��M^]�`���$ZՀ���@��V7�}�S���*BE2O��ֆ�`�2���VZPB��� �  �����R�wL�=:�^(�fNm[{ \�4��.��Mx�璛[��4����ms=g{��+e��	pIj'tTuߑ�Y��"0O��[�� [�"��YN�Z��M5���]���Z7���4�P�3�2�
Nt�(�H+���>~ͅז�^�*~���v��L��C����A�((���DT|��/�Ҏ_؞d���f�R���V9R�Z�;M�Ę&ڦx��KSn8Y����$���k߈�eZVy)�E���|����ڕ�\�O�!�ȳ�vƀs�QK�Dj��� `vW!^�A�4-+`ԑv�i���h�<X��S�_�7�g���F�FϹ�r�,;���禵K�w� =�ܨ9> �cio���!]4؏�u�HI�
Pa�P���w�7�~�R6,���!|H�hno��Z5���R�b��}R �ߕ>���[���;��n�5I']eIf �������Y��Z�X�<���bjbEe������{�����v�u�@绹m��%������	]a���F,��m��A����4d9����SF�O��&ŚUC"N,-}"-`e��.z���k���y�k]��eF���m�������8�A����e]!Ғs�:�fs^q�Xm�2-�XR�3ý��^x?s#{�{���o�jY�*�^�v�*~�������{~�Y���+J¸'��u`N5��NCGHn�ΖIq��I���������F�4�n}�5���0Yw4pI��X �_.mJQ@��
Q�,^-�X8j��(��p>�:�X�+ke+��gJ�S��f��	pi!(;�Ԙ"�5w+�V�����2?W��F�ȁYV)�J�+�`�Hk[i�I!��X�D���o�ɀGш�* �:SRZ`���0з�ۣ��ʩ�o���FS���y��qI�ia_����/ᡤ&��i�RPG�֣�_B��D�F�H��Vzj�uJ(B<��:�[)����?#�`P���K}����>���Ϋ
�5&d=+������D� EAQys�-�:�������,L&oo��M��J}�,�"���Z�Fp@���Yh-S������
��qT�P@����_Dr4��8.�,=�*�WQ��m�W����B(Ԝ���q�� g77]�y�k��af��4,4Z��\��Fc�ڠ�ł�4�_]l)e��������7MK���J����ԧ��eikJ�7�M��7���O+�$dB`�a|:½���}��f�����e�Glx�д�Ε�
�G?����~?W�Sr����L_�CLBxk�8Bi��q�wm�C&�nѓ�F��Kg���bhK�d�R���i/��>���?���=�6���{5����m՞���y7����Om�2�a!jH<�p
$�O�i�".i�1w���D)Q�� �p��[�b*����T/�]�}c���qݬ{lz�Ig��ka=n�B�����H����x~m��"�+(�O*B��
��*����@��q��[����2Y�B�Zy+ذ�L�ƈ(3G�H��c�ш�r���6�@2[�����O:����_�'2.�i�qn�	��*�LN�}��HX�@}�T�a}鍖��Ӑ��PK?����Bs_CIp���leՇqx��GF���,i�%F_R�ol���֒�@i�hÃtvw�����s�Ѭ"�~�:��r�G�ER�N��A����P����=aǲA������)_k	%Y�
�nx�o�Ҏ��VJC���T��LU|�4��q´��RLK#HX�3"$a�;�C��K׋�/���\��q�����u
�&Y�Sێ9Mz+�)j _~�P���A�dm�-�G��{��[����Z�Q���ƍI,���
G˨���ͫ��v����[��%�M����<���6��79h^E*����4�u��奅t�z���Q&#P4�?����k������UWs��n/<��*��� P`�C�B�U�{p��Ǜ4ֈ����e֍�n�h�z�^�	��yH� QAtsMb����?�PՊϣ�o�G��f�3 75H�+�^h$ �=���6��s3y
�\k���`�&w��	MtR�aO��tK���~~�������������D�Z��%��OȞ�8O��L&���z�[���"��n�� ���DG��w#�2CTbn�RWz�?�c���;EI��v@ R�
2�Bͼ>NC�0���}3@�~R�G�m�Dƙ*� l/�a�c�k hMs#P�S���P��Q�ڷB��KH/� �s�v� ׿����ȣ��F3�%[K4�0� �|��:Ɓ�0����	����5ñ�5��)3���^����O�t=��dbY����M>ѱQw�FR�<���Hb�}?f�����[�snn!Q��ް�*��7wԾ��W��k�۶���W�I�"`�~�of��5)r�f�Q�ކd/ܧ������3��?��'���]V���_S����?����������?��i��5-Yy)�&A�������o�8?�T�f����fs���kM��q�/!�ʨ��8!Q����cK=ϳ�W���zQ�;�p��	�u��ܽ~�i=i�b�2o.�	f 	���#A=�+à̬\��z��s`9?~�x�^3��1�k2��.��>���Vץ�-��3鹟��-�, M*"���\�Kq����]:=	2�'G�f��nE�	_zP+-�0}^t�nٽ�ۛq��o�ly[��y�Ξq1A����L�,u��PO��Uh��X��l�������$��)H��l>��Pc"?@b�Kb?�H��^�l!��ZúB�{'$�7��?ty��E �Y���Q��:\3i�mS�hR�I�[l���T����D�>j�̒�Gf�5���*0;F��	"�w��-�g�����l���U<M��������<Z���+���n�\�ߴ��-���Et�^�5��C�*��F5NzGO�.�á$?m ����z-6'�Z'�\D�Ҷ.D#�/�_?�˦.iq�z<�V?f��7m��5���΋룃}������E����)�4Rf)P�(�3
�P
��{�җ����}]��5�3�/̵!B�:�,�A���=�.>�~p�4ˤGm'7�M�w��UU�EU��I����H�4N���6�Ɉ92���|�bX,������e�ִ��
8��ݫ���8;?��.;\�u���3�cD�I��94�	M�p��H�!/d,;o��@b�ԑ3|�p'j<IBAm67�q��e�C�8�'����SA�����iI�2���7�s���Jy��ڲT5O��J(�&TT�іx���
���Y%�%S�c�-�7�Q��N��8'�*@Mc��z7a�E�`��uĹ�
���� $���qYK�b���"���`�������?�����5�f         �   x�ι�A A|ah^_N�o�7agO*-�ru_=5(C�.��t�h
u�ġ��`s*g(��7��g�(��V�;��Y�����>m`M�f$v�kw=�J�����O@U�O�U<�k1�(^����)�@M�՞�LRyW�>����+�         �   x���
�@ ϛ��������� ^�]��k�Vů�z�9�d.��ߊ�>�zK0q2&�K���/���|/$��̕F�bL�k��ux�ɨkZ}��׸k��b����V�jH�Š�
�]�MHjœP���+�4�x<��A]G �.E7�         U  x�}�MN1���)z��L�d�u��@ $~Vl�6���%�yXp �Ћ��
����z�}�vs�[�aq�2�PAKa%,s�XjLw8ۄ�v�0�U�1�����兖p�X¸{۽�bhNȴ��H8�Լ�+����O�R>Z�j�0�r��00#��NC�O������C)���D[l+����N�$��Dk��MIL{���cJpM�<��:/��1�LS�O�W�(a��,��#8-����cyD�w���q�o�w��>�kX���&N�u��y^�K#:dk}�shT��@r���=J	�^�=Dwv��z��������v�b�D��b��F0�> b��         �  x���Q����3��R��=T��B �	5I0soPUi���|�ퟋ��	[���������`+ť��p�tR���� ��'(��[�R���Z���v �7�$�B�q=v�;:]���� _c�9�P���=2|���cү~1�(�`�� t�|Jκ{�1�,��h��+��1��!��-�E�m���A>�=]�;;T΍ rڠV,5�M6�v��'<Q��kϩt-WKD�Ŗ?��i�ig������ɗ��J��
n�<�B�-j�}�Lz�K9����E=>B�J����6�S|�O޹p��WE�R��|����N_�1]�#���B����
v���+ y��|뷲�����Fکs����R�0�:�ݙǱG9#���IS4a'��+��9X��X�4�A򳔒���RA(�#N�dЄ�Pv��o2ꉄ=G/�0<k������T���HL���	�x�]/��`Ģlx?ir�&Lw*��I� ۱N����O�h�D`����Or��@M��'BK���{�}ՍJ�Z����ѳV/ʟ�ׂ������4я`\�E8j�L޷#�I�4y+�����l��M������v,9
(a�N$�y	_F����7c<u������0��k�D��� �O4x�h��u_8��Qk��@Q2��/ʗ��F����(@9x�����
R���3�s���4®?�/�.ji�v�O�� Ћ]�@�z�Z'P~ �f�+0���RC�	���@�/�78;��D�@���$�K��X�]��O��<�N�Z_�V���*�
P.L��]��x�0Ji4yr'�hF���S��<[Z��\�N�V�X�!�ć�`4�A��'�b���U7qJ'�V��~f��q�u�4�&�te�ǹ�ީ�/��n�V/I#���g2z���N�(Ƕ��?����s��!�!�߶5���l{
�`��i�
� Ç���d�z*.���Y+�Wo���0�ckM��͆OF��>y(��x8�O�No6���kv��Ϧ8�`4����o�*�T+8ߛ�&듪�b��B%�3L6h���ߓL�� C��C�y��ަɫR���
�J^��C4Box}��FG.9�����Ӹ�����<�Ћ��,vy��岀���2� ��:{U�R�N�+�i�3UWTA��.
72����%�<'��F$e����B}$�n\;�C3Qڂ�) �wS��7�7�l�UŦ�>�|f�y1��ACO�F��:���w���5��#�ש�qӃ���aO\��IS���6�7~�Xq�C�ɑZ�0$��c�;>$�\;-o�4��Ր����F3(�� Oma4����4�8+���u\���i��=k���빰�\U�$��y{��̠
��hnM��X�LK�k3̴�?�I4��7��C���Z�����.4�:���S�"�a������jªh1�+�:�H}J�_�f�zj���5Ŀ<2Yw���T����h'Z����Ά�C��΅q�`
�r]sj$�p��u�hqzcs��:I�b�~�p����4���R�#�۹FgY�nk�,*W�E~�A̹FoY���ƒ����s�lZ}�B�J�%�@���u�C5�m'�%y��TA�Dş!�͎�*�D�ш?������k�x;�8���i�x�']ie�\Ә4|��`��Q�Ɛ����x��j<,�k"��ۑ����ԇYt��Lk��	4��?�k��%�I����հp�ipoU���ig*�oߚ�9�n3����;Z��&��6fp�G�,lk�5ޗ�s�o�.#�L)��;�6$wy�x^���h����Ƞk�:���򄀦�Ww��D�`��o�a�&�+�n��0�o��a��'�6��%:U����>u?
�r�����Bx�h/���}S
9/�P�!�3w-,����W����jW�SͮAZLc�F��3�)JQ���q�r���&t:T��E�Y��[�\M�Cm>.,��� ��!����*�\ϡ5�H�*j��
��=��=��D$����D�Qy	��$'�\Z�X��D1<�����Q4"��U��k��"쥲#�?��DGm^!���D�'�S�J�"�7"`���%^!B#��r�������������K�c     