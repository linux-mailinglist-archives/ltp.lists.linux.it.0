Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 446AC361B2B
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 10:11:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 15C0E3C1C9A
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 10:11:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F1F0C3C1AD6
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 10:11:50 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 52CB614016F9
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 10:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618560708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZnM8deB8BvYKkE9ZpA6dEzVUVzktt4lrZrAW5EvvD8U=;
 b=LWrGPpHptWXAuhNEHNzejtOepACRG5N32yZOXVD5RplEejcPR7R8xlSJCYV1QrAimocccM
 OLIcE4ptu+oZEB0jsYJEfYHPeLmsxYyrSncFDZut8dCpwVCuGOR6eyZq+h2VvEnnSYwVKE
 gGoWOVI7zQn8PxA5i0YZkQKev+JTurA=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-T1-yZkweN86WH3-j9F8s6g-1; Fri, 16 Apr 2021 04:11:46 -0400
X-MC-Unique: T1-yZkweN86WH3-j9F8s6g-1
Received: by mail-yb1-f197.google.com with SMTP id e9so5286722ybq.22
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 01:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZnM8deB8BvYKkE9ZpA6dEzVUVzktt4lrZrAW5EvvD8U=;
 b=mUgcgTg+IRPS+VSPhcSVEem4oVWtCVNFmiHMVh67TwgGB0lHH4822tabP4ewSGCB9M
 0duw0NCX5slUNajFVLofFPdOJL4fyd1QPhZwWswW1l9ii/4BBZ//lOFsBL1c2PyPfk0u
 ZSM699xsh8tcrTXdTpcdrlGyLJbmV6whDNuAqN6FC39EJyAzv2IZ1m5g0NwD6zl9KBu7
 cBTbQYtk6cNBrboAI3Og1vZuVSKzeAkvoQ/nrF5GNuaIHdr8osfTQ2EnnOnPra7vpjoy
 6EHxd11hRSeYUDbmbuZwg3yMlKpQBKVK9EG9sRH9bJvdczq2gbCXwE7LVegKWIxpJjAW
 7Zjw==
X-Gm-Message-State: AOAM532dxBdr9Q+dnnSokmouP2Lt6QboAjFlr2vMkfH/uYarOQ+DZyCD
 qU+jScy1w3WwcF4oVPRHViP27zqn2Jj4euSfy4T3B3CF0ZH7qUXsmCL5P9kynZlTlt676hMuwlr
 AqrKEbl5XWe7pjNChR7hS39NGqYs=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr6123934ybg.86.1618560705713; 
 Fri, 16 Apr 2021 01:11:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlPCkOOjkeq5WmL0+rMzOeeEqp0F1vve0byuIlt0Fg6rAqNoz5o9Ko/NsXVdkKJEoOtgT3Dw3XeTIZKlL8Euw=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr6123915ybg.86.1618560705469; 
 Fri, 16 Apr 2021 01:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210412145506.26894-1-rpalethorpe@suse.com>
 <20210412145506.26894-6-rpalethorpe@suse.com>
In-Reply-To: <20210412145506.26894-6-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Apr 2021 16:11:33 +0800
Message-ID: <CAEemH2dkbD_-gRQeKKAh+H6vo8gb+s0dWCa1-mJ_1-eg0eLeAA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 5/7] docs: Update CGroups API
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0631403301=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0631403301==
Content-Type: multipart/alternative; boundary="000000000000e5b2b905c01287ef"

--000000000000e5b2b905c01287ef
Content-Type: text/plain; charset="UTF-8"

> +static void run(void)
> +{
> +       char buf[BUFSIZ];
> +       size_t mem = 0;
> +
> +       cg_child = tst_cgroup_mk(cg, "child");
> +       SAFE_CGROUP_PRINTF(cg_child, "cgroup.procs", "%d", getpid());
> +
> +       if (SAFE_CGROUP_VER(cg, "memory") != TST_CGROUP_V1)
> +               SAFE_CGROUP_PRINT(cg, "cgroup.subtree_control", "+memory");
> +       if (SAFE_CGROUP_VER(cg, "cpuset") != TST_CGROUP_V1)
> +               SAFE_CGROUP_PRINT(cg, "cgroup.subtree_control", "+cpuset");
>

Kind reminder:

If you decide to add controllers automatically (as I suggested in patch3/7)
in
tst_cgroup_mk(), then these lines should be removed.


> +Another example of an edge case is the following.
> +
> +[source,c]
>
> +-------------------------------------------------------------------------------
> +       if (tst_cgroup_ver(cg, "memory") == TST_CGROUP_V1)
> +               SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", ~0UL);
> +       else
> +               SAFE_CGROUP_PRINT(cg, "memory.swap.max", "max");
>

typo PRINT --> PRINTF ^.

Btw, these documented works are quite awesome!

-- 
Regards,
Li Wang

--000000000000e5b2b905c01287ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
+static void run(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[BUFSIZ];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t mem =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cg_child =3D tst_cgroup_mk(cg, &quot;child&quot=
;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CGROUP_PRINTF(cg_child, &quot;cgroup.procs=
&quot;, &quot;%d&quot;, getpid());<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (SAFE_CGROUP_VER(cg, &quot;memory&quot;) !=
=3D TST_CGROUP_V1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CGROUP_PRINT(c=
g, &quot;cgroup.subtree_control&quot;, &quot;+memory&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (SAFE_CGROUP_VER(cg, &quot;cpuset&quot;) !=
=3D TST_CGROUP_V1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CGROUP_PRINT(c=
g, &quot;cgroup.subtree_control&quot;, &quot;+cpuset&quot;);<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">Kind reminder:</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">If you d=
ecide to add controllers automatically (as I suggested in patch3/7) in</div=
><div class=3D"gmail_default" style=3D"font-size:small">tst_cgroup_mk(), th=
en these lines should be removed.</div></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+Another example of an edge case is the following.<br>
+<br>
+[source,c]<br>
+--------------------------------------------------------------------------=
-----<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cgroup_ver(cg, &quot;memory&quot;) =3D=
=3D TST_CGROUP_V1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CGROUP_PRINTF(=
cg, &quot;memory.swap.max&quot;, &quot;%lu&quot;, ~0UL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CGROUP_PRINT(c=
g, &quot;memory.swap.max&quot;, &quot;max&quot;);<br></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">typo PRIN=
T --&gt; PRINTF ^.</div></div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Btw, these=C2=A0<span style=3D"color:rgb(51,51,51);font-size:14px">do=
cumented</span>=C2=A0works=C2=A0are quite awesome!</div><div><br></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000e5b2b905c01287ef--


--===============0631403301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0631403301==--

