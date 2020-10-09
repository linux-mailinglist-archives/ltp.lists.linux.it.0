Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA98288272
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Oct 2020 08:38:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4C623C2C3F
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Oct 2020 08:38:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4811F3C24FA
 for <ltp@lists.linux.it>; Fri,  9 Oct 2020 08:38:00 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 95D721000B2D
 for <ltp@lists.linux.it>; Fri,  9 Oct 2020 08:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602225477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X4CwWZy5fMaXPbUz86sKVjBCX9lARqlHZTo919PPawg=;
 b=UvWizupCiel4Nr96SPe2BhwctFJqPzTJcF2bb5nMYLig/8OIFweD0ZNWJSSw7Kdpi6iKwS
 oQsUyx24fOymwT1dJ6/qEWkDkM4Aec6hl9KWz3f7fnIsF+dRx4ESMXlSIvBteTcCa8q8sp
 2qse0D+wzmX4ElLQWyF1XOkKu78gI7w=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-LJIJp2GMNUi365M1TbdLoQ-1; Fri, 09 Oct 2020 02:37:54 -0400
X-MC-Unique: LJIJp2GMNUi365M1TbdLoQ-1
Received: by mail-yb1-f200.google.com with SMTP id z3so2019436yba.21
 for <ltp@lists.linux.it>; Thu, 08 Oct 2020 23:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X4CwWZy5fMaXPbUz86sKVjBCX9lARqlHZTo919PPawg=;
 b=Jkvn84CGGbKkQDJFk8x6mVZJ/RIgxrSlq6uflYiEo44029THuKvzficQMvTAqvrHQz
 2PLD1fCbb7cgZXa9qh6VatJHUrLc0i8bvt7GtM4Z6v1mASHWk8nxBWcXwA3shWGf2qTw
 9Ts9HKYwkZmQK+fQZ+eMaAo9cJmWtYY7YBHHm19muHhhbgzyoCf9udq+Nfl0cpxm2oz4
 wjmtGfZhcCw/iynaHtWXikb/6zhZIerTZW1I8NSA+Vx8Mbo0aNCVebaeIkZkOfrWaNtD
 dCQy9NpUGd+t6X0F2XliAPWEOM+QA1lKAz1pIlPE7vHi+EDsF8UnB8aAzYMbgYbJ0rbO
 ROFA==
X-Gm-Message-State: AOAM531nYgcgAolXmxmy/TlG9H3z3hW6GbwQx9GFGNCXkIj0X9+e1b+S
 /ziKRIFfeaqWuL/7oBnGkAH7G+OwRWIUphdvL09pURXSsmCmydMo8kQJoLnltGGp//0ioeL1NfL
 8wHEn7kq7vJNkUYqb6/wVD0thT4I=
X-Received: by 2002:a25:69cb:: with SMTP id
 e194mr15877924ybc.243.1602225474218; 
 Thu, 08 Oct 2020 23:37:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2WmYkUQMek4lb8Wz0+59lSCdiveTT8kT9Aq5IsUpohPdCW+DwNvr/gl3lGyZTIePSzIPb+X0Tv9cVvcPivgk=
X-Received: by 2002:a25:69cb:: with SMTP id
 e194mr15877912ybc.243.1602225473980; 
 Thu, 08 Oct 2020 23:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200928061347.275858-1-yangx.jy@cn.fujitsu.com>
In-Reply-To: <20200928061347.275858-1-yangx.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 9 Oct 2020 14:37:42 +0800
Message-ID: <CAEemH2fwg58fCoNFCwMr4DgF+947kFU7-q__qZzL-ZE1ivkwaQ@mail.gmail.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
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
Subject: Re: [LTP] [PATCH] controllers/libcpuset.c: Add 'cpuset' prefix for
 cpuset files
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
Content-Type: multipart/mixed; boundary="===============0702722131=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0702722131==
Content-Type: multipart/alternative; boundary="0000000000003a231005b1373091"

--0000000000003a231005b1373091
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 2:32 PM Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:

> cpuset_cpusetofpid() in cpuset_cpu_hog.c cannot find cpuset files by
> wrong names(without 'cpuset' prefix) so cpuset_load_balance_test.sh
> reported the following error:
> ---------------------------------------
> cpuset_load_balance 1 TFAIL: load balance test failed.
> ---------------------------------------
>
> Use correct names(with 'cpuset' prefix) to find cpuset files.
>
> Fixes: #690
> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
>

Pushed, thanks for fixing this.
-- 
Regards,
Li Wang

--0000000000003a231005b1373091
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Sep 28, 2020 at 2:32 PM Xiao Yang &lt;<a hr=
ef=3D"mailto:yangx.jy@cn.fujitsu.com">yangx.jy@cn.fujitsu.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">cpuset_cpuseto=
fpid() in cpuset_cpu_hog.c cannot find cpuset files by<br>
wrong names(without &#39;cpuset&#39; prefix) so cpuset_load_balance_test.sh=
<br>
reported the following error:<br>
---------------------------------------<br>
cpuset_load_balance 1 TFAIL: load balance test failed.<br>
---------------------------------------<br>
<br>
Use correct names(with &#39;cpuset&#39; prefix) to find cpuset files.<br>
<br>
Fixes: #690<br>
Signed-off-by: Xiao Yang &lt;<a href=3D"mailto:yangx.jy@cn.fujitsu.com" tar=
get=3D"_blank">yangx.jy@cn.fujitsu.com</a>&gt;<br></blockquote><div><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Pushed, thanks fo=
r fixing this.</div><div class=3D"gmail_default" style=3D"font-size:small">=
</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000003a231005b1373091--


--===============0702722131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0702722131==--

