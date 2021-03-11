Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B90DE3372FC
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 13:46:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D2BA3C69B0
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 13:46:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E8ABF3C3367
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 13:46:29 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 4C255100093F
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 13:46:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615466787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IoOm3ihBueUFBjbOLS+awcBxqn7ai3DwO/L5UcLSbF4=;
 b=ha2h327DQS182rpwoXGgVjuWfQ8El2BsZkicwQRrjK48tetiw5FltuSSC/4R0ATwn9ZIXi
 lai+8BtjFUbBevbBTxb1xl5/xF2PtxXmox5Nf6nyGXl+IBaHqVXt8YVC81WWRmYhwX0dJj
 KMREsF/jBpDLsxEXsbuHk3dz/hpSNlA=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-uvAJ1OodOgqPsjMRiSCWVw-1; Thu, 11 Mar 2021 07:46:23 -0500
X-MC-Unique: uvAJ1OodOgqPsjMRiSCWVw-1
Received: by mail-yb1-f199.google.com with SMTP id v62so25321462ybb.15
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 04:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IoOm3ihBueUFBjbOLS+awcBxqn7ai3DwO/L5UcLSbF4=;
 b=MicBu0u9PWi0hs43mZHqeh9EpOHhzxC1WQNnz25LzcRaY+SmL8fBXtZIZERpPxju3m
 muSBLu20JjUCw49E1FSYmgT09JaWwGwGtkxZGsUhamHqNFrxCVkH1hF1JjUWnWGZOOyx
 Kf9brHVpIRCx6J5vAB/RfTTjaCwfTgcTDjVLx8RxDL014amDfziix4jQuzCittJwLre2
 o1bYPIDfPb9BzB3Tumfefv8eaubvmNx9RhXkVMG7uAQdr/QWqW0uGDZQfuQALkw76nvT
 tGJ55uqNhTwah7g3EiPr2IAV95ATN9+6vq9kVJtNCgOnFzIEcBaM/aVBA3sIzpOZXCpe
 lOQw==
X-Gm-Message-State: AOAM531LhM6pDcWbvT5WzFGWdPnSiDf7b3SnyJq+rxCcuGtNd6phVJIH
 DP7sqXz9BNGYGUrIE4uPpx8VpzyxyCA5J1d4tm4mHFApx35lE2//Vi9yCAUO7YB9WkVJlAr1A8y
 YfUEZJaYhbSNVuBrzkO7tmet+vjY=
X-Received: by 2002:a25:3417:: with SMTP id b23mr8620318yba.252.1615466783188; 
 Thu, 11 Mar 2021 04:46:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLollGNtEKE3uHijYB8dcFXhT3sStNTlgqaBLgoNGBm2oLFNqkjRcdaFXVmAQkSfebah7CBS0UPrlAnwHRPFE=
X-Received: by 2002:a25:3417:: with SMTP id b23mr8620281yba.252.1615466782875; 
 Thu, 11 Mar 2021 04:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20210311105509.2701-1-chrubis@suse.cz>
In-Reply-To: <20210311105509.2701-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 11 Mar 2021 20:46:11 +0800
Message-ID: <CAEemH2ed2nX6NotjzZZ+UQRsaEo-xCqx698vWODvh39dXr6A4A@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/4] Add proper filesystem skiplist
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
Content-Type: multipart/mixed; boundary="===============1321228938=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1321228938==
Content-Type: multipart/alternative; boundary="000000000000bd790705bd422b8c"

--000000000000bd790705bd422b8c
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 6:53 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> This adds a proper .skip_filesystems array to the tst_test structure and
> implements support for both test with .all_filesystems enabled and
> disabled.
>
> As a bonus point we get the list of filesystems that the test does not
> support exported to the metadata as well.
>
> Changes in v2:
>
> * Add docs (as Jan requested)
>
> * Move the skiplist detection from the is_supported_by_kernel()
>   to tst_fs_is_supported()
>   (as requested by Martin and Li)
>   (which also fixed the double message reported by Peter)
>
> * Fixed typos in tst_fs.h header (as requested by Peter)
>
> Cyril Hrubis (4):
>   lib: Add proper filesystem skiplist
>   lib: tst_fs_type change fs names to lowercase
>   lib: Apply the skip_filesystems to rest of test as well
>   doc: Update docs on filesystem detection
>

For series:
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000bd790705bd422b8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 6:53 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">This adds a proper .skip_fi=
lesystems array to the tst_test structure and<br>
implements support for both test with .all_filesystems enabled and<br>
disabled.<br>
<br>
As a bonus point we get the list of filesystems that the test does not<br>
support exported to the metadata as well.<br>
<br>
Changes in v2:<br>
<br>
* Add docs (as Jan requested)<br>
<br>
* Move the skiplist detection from the is_supported_by_kernel()<br>
=C2=A0 to tst_fs_is_supported()<br>
=C2=A0 (as requested by Martin and Li)<br>
=C2=A0 (which also fixed the double message reported by Peter)<br>
<br>
* Fixed typos in tst_fs.h header (as requested by Peter)<br>
<br>
Cyril Hrubis (4):<br>
=C2=A0 lib: Add proper filesystem skiplist<br>
=C2=A0 lib: tst_fs_type change fs names to lowercase<br>
=C2=A0 lib: Apply the skip_filesystems to rest of test as well<br>
=C2=A0 doc: Update docs on filesystem detection<br></blockquote><div><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">For series:</div=
><div class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wan=
g &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div><=
/div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div =
dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000bd790705bd422b8c--


--===============1321228938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1321228938==--

