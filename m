Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0562D2E7E61
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 07:12:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD8BB3C2939
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 07:12:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 916B63C2879
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 07:12:12 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 25E7D600740
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 07:12:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609395129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EJjGK/GDATeijAs1iim+F6aBlCZLZdbxGZ1YlmyEMJg=;
 b=JrEFTUzo9ZUNNDyCFjQNyH8t8OVMMljzK8leVrhviRUS12tkbl/7LFUwFX7EvWRzXpCswJ
 JNZ4ahIH/skNEIMNf6Hb0MWRVI713rZ0btg3yUrKqpFsf2p5vsMxSBlL0bmMLvinoiiAkw
 STt4DXrstZ5pxiVE/IIN/DEwVe60TmE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-egmm6ysXMj2CwmRwQNVvgg-1; Thu, 31 Dec 2020 01:12:07 -0500
X-MC-Unique: egmm6ysXMj2CwmRwQNVvgg-1
Received: by mail-yb1-f197.google.com with SMTP id g67so32478252ybb.9
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 22:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EJjGK/GDATeijAs1iim+F6aBlCZLZdbxGZ1YlmyEMJg=;
 b=Hfox+lCGf1E28irKx5QdkWkGanaS4VQqStNSInTmhwILIV1whD0VYO9TLIjWHeHdnS
 AdaFBQhitpDrn+vbnITNmSVOVPcQLwYsNQ4mtzbe9Dmbl+3ULCArIVhHS9OpgpJxnnu5
 ujBdqzYxwIyU9udOIWZ9BqmfKCgh8lKVTeczGiRAjDaJkbtKncie8XRvBMCapVTZ0kAc
 d79cdTJOq26lCPtQwa9MpTiPE4HfDQsrFsRFwNsq40Cyp4GFpAoS2WoYb89nwPXWk1es
 VgipelgYcMb8TKF7Lu2nMVhvy5qUgB0QSHtsfo1nQOKT0ujxSR/v9ptp+UBDViIWo5IC
 RGXQ==
X-Gm-Message-State: AOAM530owNZ1NCxWO6bj4MlaiY0njYxyB9w+YjGX7lAZuPAsAZXaM7G3
 8ctVyuFIN1QNUt+EnwhsFJ6T7kfy3ncO0I5mZxy55LiYki0uuiTds8BdGVTfc1lN72k80SU8aaM
 Sufp2zd9hcq3lTqPv3KVTRaFD+Rs=
X-Received: by 2002:a25:cc92:: with SMTP id
 l140mr85456653ybf.252.1609395126419; 
 Wed, 30 Dec 2020 22:12:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtl0QXPP5/DYwq1VGrTquMr0ldQt5R+lllKlHqa5J6L7bRRlCPsRx5bFc67d2Krwwu2YCE5TNaCpTaWJQIevA=
X-Received: by 2002:a25:cc92:: with SMTP id
 l140mr85456629ybf.252.1609395126125; 
 Wed, 30 Dec 2020 22:12:06 -0800 (PST)
MIME-Version: 1.0
References: <1609320324-8405-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1609320324-8405-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 31 Dec 2020 14:11:54 +0800
Message-ID: <CAEemH2c93BaWdGMv1ZdmiJ2bFntrvgVTkV6_k_cX0EeqeQ9iKA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
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
Subject: Re: [LTP] [PATCH] lib/tst_safe_sysv_ipc.c: add other cmds in
 ret_check
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
Content-Type: multipart/mixed; boundary="===============0534601025=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0534601025==
Content-Type: multipart/alternative; boundary="000000000000cbdc2e05b7bc8083"

--000000000000cbdc2e05b7bc8083
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

Pushed, thanks.

-- 
Regards,
Li Wang

--000000000000cbdc2e05b7bc8083
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Push=
ed, thanks.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div>=
</div></div></div>

--000000000000cbdc2e05b7bc8083--


--===============0534601025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0534601025==--

