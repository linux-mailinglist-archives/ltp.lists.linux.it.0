Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E18603858
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Oct 2022 05:00:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FBE83CB0EA
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Oct 2022 05:00:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DE9DE3CAC43
 for <ltp@lists.linux.it>; Wed, 19 Oct 2022 05:00:43 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E3E3E1A00CC2
 for <ltp@lists.linux.it>; Wed, 19 Oct 2022 05:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666148441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9iJjOrzwURyv+Np3bQ6X4c0+crDvwpfWX9kThS3M4A=;
 b=MakWPrmC6mU3T5WEw6zJ+Dh+BCyTqb4BxaWmoOuyw70ui+JzCBeVlbxugxkAlw3IRomf6M
 7vC0P3xj4Yb0qWdGFR3X/y49u+eTXkKPZIFaSlDKoOkusf4s25ITKUD7jIFTEWxyTW77IT
 9hZcweaUAMhk3Oa48oVVY5PwUFG6gUg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-71SdU4xUOVyJBpI5VwUOYg-1; Tue, 18 Oct 2022 23:00:39 -0400
X-MC-Unique: 71SdU4xUOVyJBpI5VwUOYg-1
Received: by mail-wm1-f71.google.com with SMTP id
 125-20020a1c0283000000b003c6d73209b0so3667168wmc.1
 for <ltp@lists.linux.it>; Tue, 18 Oct 2022 20:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/9iJjOrzwURyv+Np3bQ6X4c0+crDvwpfWX9kThS3M4A=;
 b=f6fhqLX32SVCOFwdjtBBr5z7y8Tzxsf3Z/r5RADHws73shIADVNDA/Nq3dj4D8FCIL
 k6/PVNlY0VS8gzqjkj2V5NLIlEj4MSRNTfms7afR5RxvfXSFUsVx71NOlNJKMVFpxa3r
 //o15p/hJQdYj9To23qOei5x8LzUI987Iw9H7vmbjsIpTwNpUpaBCWdVkUsStTKW2tlO
 tG0pl0dkmY/6BdNmXpIChU/QglnpooR3aJ+I3fEUhdjo/fLGJZW9t3DR/GVnMXx2L2EN
 BTZWbfbp3T/9QSBZAWSxEFhKpAhiLDM/8jSCzjuadt1jXt4II2b3eK5SWQV2ZZKS7pT8
 Q0TQ==
X-Gm-Message-State: ACrzQf3zDjsPbhKb+NjzsGbhOL1dY8wwZN2H+GGA71yF5nTcCAubDFYF
 tSX666ivSSU0jwcvjMd3iGFcH+ZQuoYqdCUaXPgfaodf7/ZVuRv+HeBtqgu2I613yY2ZOvvWs4c
 NBK1DICy8t/kXGb9hpDjDY09wD4o=
X-Received: by 2002:a5d:64e2:0:b0:22e:7060:b4a7 with SMTP id
 g2-20020a5d64e2000000b0022e7060b4a7mr3346641wri.129.1666148438949; 
 Tue, 18 Oct 2022 20:00:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5l8+nxt2tq5GacA2/78zJZc0wfyzrDkrnIuCNPIXsBQWj9y0AwcuCylMklUPzRrfuFTOm40ajWMlwbdkDpTIY=
X-Received: by 2002:a5d:64e2:0:b0:22e:7060:b4a7 with SMTP id
 g2-20020a5d64e2000000b0022e7060b4a7mr3346636wri.129.1666148438785; Tue, 18
 Oct 2022 20:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <1666149553-26514-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1666149553-26514-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 19 Oct 2022 11:00:25 +0800
Message-ID: <CAEemH2eH6fpO6qV4sW_R_jNesUvKAyGNeves7GftC6ABD8bt5g@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_safe_file_at: Add missing stat related header
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1810821296=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1810821296==
Content-Type: multipart/alternative; boundary="000000000000d6559205eb5a69b0"

--000000000000d6559205eb5a69b0
Content-Type: text/plain; charset="UTF-8"

Pushed together with Richard's fix, thanks!

-- 
Regards,
Li Wang

--000000000000d6559205eb5a69b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Pushed together with Richard&#39;s fix, thanks!</div></div><d=
iv><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000d6559205eb5a69b0--


--===============1810821296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1810821296==--

