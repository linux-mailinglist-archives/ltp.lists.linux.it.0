Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E5E320F95
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 03:53:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC2103C6598
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 03:53:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 94B713C3236
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 03:52:58 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8D8DA60056A
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 03:52:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613962375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DZdQ9PB1aMIv7vx2IYNA0+T/w+P4yMSicDO5KrTyBY4=;
 b=GzxzfqSlUu26uGCHnkmGfxYesNofH4Sb+w5Zgu7hSGLZVJfTft4Ss6dMeWcmUelX6QbYBb
 KSnFnlP7dYyacsI0K1es5ZXf8x8O1tOd4VOOFpucCRVYTGpf+q04V88dlhqIl0fpkQj6nI
 OuZ5Vm0uJK8KcPhjw7aE5eur/r5+QOI=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-IdVIxI0GNo6L10KD9846Ig-1; Sun, 21 Feb 2021 21:52:52 -0500
X-MC-Unique: IdVIxI0GNo6L10KD9846Ig-1
Received: by mail-yb1-f199.google.com with SMTP id j4so14960944ybt.23
 for <ltp@lists.linux.it>; Sun, 21 Feb 2021 18:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DZdQ9PB1aMIv7vx2IYNA0+T/w+P4yMSicDO5KrTyBY4=;
 b=SkKVMNYaHLqsExTPxZGTnKQlhNqUgtnafDjWaylF5NtNX9R3TMiDa+QUZAMPjJVO1Y
 1/ytLJLx9fvqAWhSAPxOQ+CTfTI1vOD4CJrzaTpHGJD33SMnrlvwYQXiCCXsf46gdqby
 Zj97baje7DmiObIzj3j3w5CNIK88mNB+sLFN1f8DgNYcxyX3tm8hg/spTizFvPLurbAr
 1pBOKhLyomv+0ok0YF1fN4qabqQjZJvJ3jld/I3JpA5mIBBrIl2CNm0maKIwDm/oiIAE
 hY241oxDRBp9r5U7dG7AyBNWf2onqj/qgId69gj7yDbpBACLMMraxsDVquToJjI6amSH
 m7Lw==
X-Gm-Message-State: AOAM532xA+Rphl6oUiUsz2O0MJH9MCBjV37V8mkrY+D6Vr+VBSz7L4B+
 LXDbEwSCm18ag46TCLV334x/oTCzS9ofPV3oF2uVQoIlx068ybIA3RsY+YXrpv6HXXIFQXQ3QXp
 bhTiuG6E3WhyKLN/eDyBWq9JB9e4=
X-Received: by 2002:a25:bd12:: with SMTP id f18mr6069955ybk.403.1613962371699; 
 Sun, 21 Feb 2021 18:52:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqkRadBr3RrdVaVWjrNGMQhV2lFlUaA03RRi3/uQvnyxZFFY567hRthKefoUNIEM5JPGeAphtg+TY8x0R1XiQ=
X-Received: by 2002:a25:bd12:: with SMTP id f18mr6069939ybk.403.1613962371482; 
 Sun, 21 Feb 2021 18:52:51 -0800 (PST)
MIME-Version: 1.0
References: <1613961134-31207-1-git-send-email-zhufy.jy@cn.fujitsu.com>
In-Reply-To: <1613961134-31207-1-git-send-email-zhufy.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 22 Feb 2021 10:52:39 +0800
Message-ID: <CAEemH2eLqdnMnffAmhWx9-KZ9ybif9fmMTAGsE582s+H1FEkmA@mail.gmail.com>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_stat_test.sh: Add missing dot in cd command
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
Content-Type: multipart/mixed; boundary="===============1062160176=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1062160176==
Content-Type: multipart/alternative; boundary="000000000000d557c305bbe3e55f"

--000000000000d557c305bbe3e55f
Content-Type: text/plain; charset="UTF-8"

Patch applied, thanks.

-- 
Regards,
Li Wang

--000000000000d557c305bbe3e55f
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr"><div class="gmail_default" style="font-size:small">Patch applied, thanks.</div></div><div><br></div>-- <br><div dir="ltr" class="gmail_signature"><div dir="ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000d557c305bbe3e55f--


--===============1062160176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1062160176==--

