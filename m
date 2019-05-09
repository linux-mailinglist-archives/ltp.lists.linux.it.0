Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE2818674
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 10:00:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8C393EABC3
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 10:00:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A418D3EABC2
 for <ltp@lists.linux.it>; Thu,  9 May 2019 10:00:54 +0200 (CEST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E112160CBA8
 for <ltp@lists.linux.it>; Thu,  9 May 2019 10:00:54 +0200 (CEST)
Received: by mail-vs1-f54.google.com with SMTP id e2so813889vsc.13
 for <ltp@lists.linux.it>; Thu, 09 May 2019 01:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZV5jyAvSDfuxne/M4Qx+RKlisEkxwvYCLT/xBFolDXg=;
 b=nbCgWjKURMwHIQ8ZXnMwUjHC7AhMKJOoU9y2dg5PsmSbYRcgJeKx1smzLZiYvguEHG
 pH2y4dbAVXTYxJ1HxzZ8HDbQ8MubNY6WStPeh9IhLG8BZbmQbx2thtpJ4J4Zv9OauYLK
 VmO23Oc4Qrpq5Kjj9ZXDTStzWSDpg30mSn5z4mAU+0mQKWlGIevc2H6SrF/T4SsdgAkp
 ijZkNikHqPsJ33lsHToq/39399vMNQy4jxXtx78lveJs+duC72epjENC3D9PysHSHqf7
 WP+nW1OUDt5nqOi/DLECVjiTUHS3UyWqGdfJE76KWv2xxhRpbKlhvrn27cf0qv2Q/FOy
 rIiw==
X-Gm-Message-State: APjAAAW7kO3FqCh86XNyxI5DEc4gIqaKtgw/INSCPsReWXPhVz+Cw9q4
 1KCZkO6z19z0T4pP96vy4Id8P6BwN1NbsLEZkdt11UlGAIE=
X-Google-Smtp-Source: APXvYqxOGF2FZJgZeKySwgcwxG27A0Ov6bWCYD3Gvw2h3P0lp1J7/e+CytJTsifWv8qt/e8NY1wa+b7vhehe8Qd7S+8=
X-Received: by 2002:a67:ea0b:: with SMTP id g11mr1527281vso.130.1557388851489; 
 Thu, 09 May 2019 01:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190508084447.18191-1-liwang@redhat.com>
 <20190508084447.18191-2-liwang@redhat.com>
 <20190509064535.GA6096@dhcp-9-109-247-167.in.ibm.com>
In-Reply-To: <20190509064535.GA6096@dhcp-9-109-247-167.in.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 9 May 2019 16:00:40 +0800
Message-ID: <CAEemH2ei_ORaYzfmfJOiPr0Gb7R2Kt2-WNWGp9fVBSzqGiWeug@mail.gmail.com>
To: Balamuruhan S <bala24@linux.vnet.ibm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/2] libltpnuma: remove restrictions on numa
	node-id
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1600733039=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1600733039==
Content-Type: multipart/alternative; boundary="00000000000045458f05886fd9ea"

--00000000000045458f05886fd9ea
Content-Type: text/plain; charset="UTF-8"

On Thu, May 9, 2019 at 2:45 PM Balamuruhan S <bala24@linux.vnet.ibm.com>
wrote:

> On Wed, May 08, 2019 at 04:44:47PM +0800, Li Wang wrote:
> > For some ppc64le systems, it has non-continuous numa nodes in
> > hardware configuration. So we're hitting the below warnings while
> > running set_mempolicy tests on that. To fix this issue, let's just
> > remove restrictions on numa node-id in get_mempolicy().
> >
> > Error Log
> > ---------
> > tst_test.c:1096: INFO: Timeout per run is 0h 50m 00s
> > tst_numa.c:190: INFO: Found 2 NUMA memory nodes
> > set_mempolicy01.c:63: PASS: set_mempolicy(MPOL_BIND) node 0
> > tst_numa.c:26: INFO: Node 0 allocated 16 pages
> > tst_numa.c:26: INFO: Node 8 allocated 0 pages
> > set_mempolicy01.c:82: PASS: child: Node 0 allocated 16
> > set_mempolicy01.c:63: PASS: set_mempolicy(MPOL_BIND) node 8
> > tst_numa.c:92: WARN: get_mempolicy(...) returned invalid node 8
> > tst_numa.c:92: WARN: get_mempolicy(...) returned invalid node 8
> > tst_numa.c:92: WARN: get_mempolicy(...) returned invalid node 8
> > ...
> > tst_numa.c:26: INFO: Node 0 allocated 0 pages
> > tst_numa.c:26: INFO: Node 8 allocated 0 pages
> > set_mempolicy01.c:86: FAIL: child: Node 8 allocated 0, expected 16
> >
> > lscpu
> > -----
> > Architecture:        ppc64le
> > ...
> > CPU(s):              128
> > Core(s) per socket:  16
> > Socket(s):           2
> > NUMA node(s):        2
> > Model name:          POWER9, altivec supported
> > ...
> > NUMA node0 CPU(s):   0-63
> > NUMA node8 CPU(s):   64-127
> >
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > Cc: Cyril Hrubis <chrubis@suse.cz>
> > ---
> >  libs/libltpnuma/tst_numa.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/libs/libltpnuma/tst_numa.c b/libs/libltpnuma/tst_numa.c
> > index 0ba6daf39..56c8640ff 100644
> > --- a/libs/libltpnuma/tst_numa.c
> > +++ b/libs/libltpnuma/tst_numa.c
> > @@ -88,8 +88,9 @@ void tst_nodemap_count_pages(struct tst_nodemap *nodes,
> >               if (ret < 0)
> >                       tst_brk(TBROK | TERRNO, "get_mempolicy() failed");
> >
> > -             if (node < 0 || (unsigned int)node >= nodes->cnt) {
> > -                     tst_res(TWARN, "get_mempolicy(...) returned
> invalid node %i\n", node);
> > +             if (node < 0) {
>
> It is better to have check for powerpc and remove restriction as it will
> still hold good for other arch.
>

If the non-continuous numa nodes only appear in ppc machine, that should be
necessary to check arch before removing the restriction.

then the patch probably like:

--- a/libs/libltpnuma/tst_numa.c
+++ b/libs/libltpnuma/tst_numa.c
@@ -88,7 +88,11 @@ void tst_nodemap_count_pages(struct tst_nodemap *nodes,
                if (ret < 0)
                        tst_brk(TBROK | TERRNO, "get_mempolicy() failed");

+#if defined (__powerpc64__) || (__powerpc__)
+               if (node < 0) {
+#elif
                if (node < 0 || (unsigned int)node >= nodes->cnt) {
+#endif
                        tst_res(TWARN, "get_mempolicy(...) returned invalid
node %i\n", node);
                        continue;
                }


-- 
Regards,
Li Wang

--00000000000045458f05886fd9ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 9, 2019 at 2:45 PM Bal=
amuruhan S &lt;<a href=3D"mailto:bala24@linux.vnet.ibm.com" target=3D"_blan=
k">bala24@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Wed, May 08, 2019 at 04:44:47PM +0800, Li Wa=
ng wrote:<br>
&gt; For some ppc64le systems, it has non-continuous numa nodes in<br>
&gt; hardware configuration. So we&#39;re hitting the below warnings while<=
br>
&gt; running set_mempolicy tests on that. To fix this issue, let&#39;s just=
<br>
&gt; remove restrictions on numa node-id in get_mempolicy().<br>
&gt; <br>
&gt; Error Log<br>
&gt; ---------<br>
&gt; tst_test.c:1096: INFO: Timeout per run is 0h 50m 00s<br>
&gt; tst_numa.c:190: INFO: Found 2 NUMA memory nodes<br>
&gt; set_mempolicy01.c:63: PASS: set_mempolicy(MPOL_BIND) node 0<br>
&gt; tst_numa.c:26: INFO: Node 0 allocated 16 pages<br>
&gt; tst_numa.c:26: INFO: Node 8 allocated 0 pages<br>
&gt; set_mempolicy01.c:82: PASS: child: Node 0 allocated 16<br>
&gt; set_mempolicy01.c:63: PASS: set_mempolicy(MPOL_BIND) node 8<br>
&gt; tst_numa.c:92: WARN: get_mempolicy(...) returned invalid node 8<br>
&gt; tst_numa.c:92: WARN: get_mempolicy(...) returned invalid node 8<br>
&gt; tst_numa.c:92: WARN: get_mempolicy(...) returned invalid node 8<br>
&gt; ...<br>
&gt; tst_numa.c:26: INFO: Node 0 allocated 0 pages<br>
&gt; tst_numa.c:26: INFO: Node 8 allocated 0 pages<br>
&gt; set_mempolicy01.c:86: FAIL: child: Node 8 allocated 0, expected 16<br>
&gt; <br>
&gt; lscpu<br>
&gt; -----<br>
&gt; Architecture:=C2=A0 =C2=A0 =C2=A0 =C2=A0 ppc64le<br>
&gt; ...<br>
&gt; CPU(s):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 128<br>
&gt; Core(s) per socket:=C2=A0 16<br>
&gt; Socket(s):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
&gt; NUMA node(s):=C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
&gt; Model name:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 POWER9, altivec supporte=
d<br>
&gt; ...<br>
&gt; NUMA node0 CPU(s):=C2=A0 =C2=A00-63<br>
&gt; NUMA node8 CPU(s):=C2=A0 =C2=A064-127<br>
&gt; <br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; Cc: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_bla=
nk">chrubis@suse.cz</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 libs/libltpnuma/tst_numa.c | 5 +++--<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/libs/libltpnuma/tst_numa.c b/libs/libltpnuma/tst_numa.c<b=
r>
&gt; index 0ba6daf39..56c8640ff 100644<br>
&gt; --- a/libs/libltpnuma/tst_numa.c<br>
&gt; +++ b/libs/libltpnuma/tst_numa.c<br>
&gt; @@ -88,8 +88,9 @@ void tst_nodemap_count_pages(struct tst_nodemap *nod=
es,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0tst_brk(TBROK | TERRNO, &quot;get_mempolicy() failed&quot;);<b=
r>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (node &lt; 0 || (u=
nsigned int)node &gt;=3D nodes-&gt;cnt) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_res(TWARN, &quot;get_mempolicy(...) returned invalid node %i\n&q=
uot;, node);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (node &lt; 0) {<br=
>
<br>
It is better to have check for powerpc and remove restriction as it will<br=
>
still hold good for other arch.<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">If the non-continuous numa =
nodes only appear in ppc machine, that should be necessary to check arch be=
fore removing the restriction.</div><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">then the patch probably like:</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult">--- a/libs/libltpnuma/tst_numa.c</div><div class=3D"gmail_default">+++=
 b/libs/libltpnuma/tst_numa.c</div><div class=3D"gmail_default">@@ -88,7 +8=
8,11 @@ void tst_nodemap_count_pages(struct tst_nodemap *nodes,</div><div c=
lass=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (ret &lt; 0)</div><div class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBRO=
K | TERRNO, &quot;get_mempolicy() failed&quot;);</div><div class=3D"gmail_d=
efault">=C2=A0</div><div class=3D"gmail_default">+#if defined (__powerpc64_=
_) || (__powerpc__)</div><div class=3D"gmail_default">+=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (node &lt; 0) {</div><div class=3D"gm=
ail_default">+#elif</div><div class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (node &lt; 0 || (unsigned int)node &g=
t;=3D nodes-&gt;cnt) {</div><div class=3D"gmail_default">+#endif</div><div =
class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TWARN, &quot;get_mempolicy(...) =
returned invalid node %i\n&quot;, node);</div><div class=3D"gmail_default">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;</div><div class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"></div></div><br clear=3D"all"><div><br></div>-- <br>=
<div dir=3D"ltr" class=3D"m_-5166788601101912600gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div></d=
iv>

--00000000000045458f05886fd9ea--

--===============1600733039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1600733039==--
