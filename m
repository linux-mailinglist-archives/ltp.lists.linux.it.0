Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F14E6EB9
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Mar 2022 08:17:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03D333C6574
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Mar 2022 08:17:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 70E3B3C54FB
 for <ltp@lists.linux.it>; Fri, 25 Mar 2022 08:17:27 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C5CD31001178
 for <ltp@lists.linux.it>; Fri, 25 Mar 2022 08:17:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648192645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DLfsXJdGSOzyNyle/FL8TrYi0NCR6ZT7FhJ9Eqa/ZtA=;
 b=T/t50mnNzSO47iOEpj5hwFSPTfxkps7F9QMYjH5OttntHWH7TlTi+s1p/tHsd8tN5LSjcG
 aw+39guQ4Jzwbrfeox6rTyG5Wb2ERlgjV3zzyBdG5f5DIZLyWLWgazYl64dm59fMJ9WYVZ
 21vnHZ+G4WAZrR1k3gL00Fw2j8COvBQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-3X6l8NxoOviW4utcmUDKjg-1; Fri, 25 Mar 2022 03:17:23 -0400
X-MC-Unique: 3X6l8NxoOviW4utcmUDKjg-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-2e5a3c1384cso54210577b3.4
 for <ltp@lists.linux.it>; Fri, 25 Mar 2022 00:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DLfsXJdGSOzyNyle/FL8TrYi0NCR6ZT7FhJ9Eqa/ZtA=;
 b=UU4BQ+rXCZY+f8kBAm1kxioO5teZHYNXOSww9M3mfWGCBPOMNiRxa3so/2WqlcRF7Z
 vcTf8Iww2AIFHwMD9rzkpUAKVQdMb8a4TpDoqx7icisIUBa5BwSwX8/1cH4qnvPfYVSD
 IoPaDBo9zyEVRiyE3+WhdXlOCWzuwpBchAsoOOX7PGx8OxC54VCbBfLq51kQBKZQCQN2
 sfEx/pkk5aLnmEB3P9PkryhNlT7tn0BHCQxMN9LMepxpGNDniVcKODogcXVw/lI0bXVx
 1ZIq8JBeenInW+6R/oDLR9EaGGDfIxb0AmzJfcjyYV3dhmhHVbdg6kxbQrfYqPHLdzB7
 41Jw==
X-Gm-Message-State: AOAM530Sl8EggXUPeK8qPdmfPCBbz4HYrxYqtEa21L/4wo1Nkk3UWEXM
 TABsesqWIgeZUpJnuYJcc1iGW9m0VmYl0o3Z32u4Wxi/YU2CORMIAUcVJc4Jrcf1MPffVKWV7BR
 953HLnEug5Yh5XPQoKjpBqMtT9Xg=
X-Received: by 2002:a81:b8a:0:b0:2e5:c218:14c7 with SMTP id
 132-20020a810b8a000000b002e5c21814c7mr8723651ywl.90.1648192642595; 
 Fri, 25 Mar 2022 00:17:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjbrFy9Lh2oDO+xwuKqKi0Sf9DD5lyOp4SHz5Z8Au6mgq28xYjQ6IgBcNh7QsimBW9C1EHRJ75T6wIeAJEoiI=
X-Received: by 2002:a81:b8a:0:b0:2e5:c218:14c7 with SMTP id
 132-20020a810b8a000000b002e5c21814c7mr8723627ywl.90.1648192642203; Fri, 25
 Mar 2022 00:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220324234950.2229888-1-chuhu@redhat.com>
In-Reply-To: <20220324234950.2229888-1-chuhu@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 25 Mar 2022 15:17:11 +0800
Message-ID: <CAEemH2dDhkMAwRjGmY4XNjqt7HOQzvuXT9=Bz4MnUQerENo57w@mail.gmail.com>
To: Chunyu Hu <chuhu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] futex_waitv03: cleanup shms
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
Content-Type: multipart/mixed; boundary="===============0085756650=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0085756650==
Content-Type: multipart/alternative; boundary="000000000000f5d75705db05c0a1"

--000000000000f5d75705db05c0a1
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Li Wang <liwang@redhat.com>


-- 
Regards,
Li Wang

--000000000000f5d75705db05c0a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr"><div class=3D"gmail_default" style=3D"font-size:small">=
Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat=
.com</a>&gt;</div><br></div></div><div><br></div>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wan=
g<br></div></div></div></div>

--000000000000f5d75705db05c0a1--


--===============0085756650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0085756650==--

