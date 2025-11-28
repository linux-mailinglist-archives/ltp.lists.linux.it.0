Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D737C9107A
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Nov 2025 08:21:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1764314516; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=cUb1zQm5BxqOLTg9kt5cBs8a7X9r/NLHLidQapozy5k=;
 b=CoUVO4da07oQDyhdjJor2CBiRcsS/kultnAfNlLcL4kq5ZQ6+IoXdiLZOJhyPShZZz3+3
 eZElkM/Y8Q1d+9Q442VZKlPCMfo2bpUg9KlnOzoANQP3ujuTLctqFvBvu71hcr6gxy03KI6
 +TK6vBCZLawza8ouaZUBO5b25XgOgUg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEA8B3CDFEB
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Nov 2025 08:21:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3B5A23C79A8
 for <ltp@lists.linux.it>; Fri, 28 Nov 2025 08:21:44 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 735C6200A1D
 for <ltp@lists.linux.it>; Fri, 28 Nov 2025 08:21:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764314501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0CMd+OPJIniZncXqumYX0vkWezNm6SMAxCZSlHq/q0=;
 b=Ucf4VCA7B92acolhDe8MbEyCdzCDa51bS/Y0WZ42M8LcyIQ1MOj55JEBmNqFiI+2ePUCGb
 UzPps5hsGniad1XM9T1P7PJ6mX9s8N7c9M/m1FD2qbV2lqlkZwHKwa0bG7XjyWtWTImrZr
 IbrH8YW4hOkbBYXhh6+A0L/vmx+8cuA=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-Ndp0y60VPJ2-P6v6MILhgw-1; Fri, 28 Nov 2025 02:21:39 -0500
X-MC-Unique: Ndp0y60VPJ2-P6v6MILhgw-1
X-Mimecast-MFC-AGG-ID: Ndp0y60VPJ2-P6v6MILhgw_1764314498
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-bc09a8454b9so4335650a12.1
 for <ltp@lists.linux.it>; Thu, 27 Nov 2025 23:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764314497; x=1764919297;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0CMd+OPJIniZncXqumYX0vkWezNm6SMAxCZSlHq/q0=;
 b=F1Jbd8LJRhdrTDoUWKN+i5IpedTKdSkoghxSnGmD8kb9upxVEIDpJH3hY6WVmOPNJi
 chPOzPEQcYjYYDgY2BPrYxyj0Ix+RxDl4DZhR7lbxP7qT6DuwpBqRbc0q72U6SeMOAxn
 jlKXqbTcJZSpTrXpsCVu16T1cJKwg/3iNexn398i5baQncfNDCCP8MlwILBiUVx61esU
 ve/VFmmoDG1RzmSmm+bFzdTfn8qw4IoRYiZmFWEbbUP5ZxcevxHazGFmCyyiZqJ36qSh
 TcSQVoprD+879oOD6YV4zYK2sc8ML4T1Xp7zkp+Rg0Rl7kWypsBmxZhGJ5Y2a4MLysHE
 by6A==
X-Gm-Message-State: AOJu0YyRleHtyOYzwrNoeKoAKz9BLxvPnnI5o/K/4bPnwDmKNrcWN05S
 bfbbdcMNJ4HlDIgEIFZjP4p31W7h0TMHEuUvAxNWPCzmzPLbcc1Ngo+av28E93FHYM6ABmZHBRl
 MWpFe4M2/lw+9Jd8rekc5AYi7/HAWBEWHvJ4bfmptpuTepUdIxIRcK3dqHs2hPyreYssMmEYcVx
 a9HL56ip6YZoi+Lqwzi3U1Ne/WR5RJjE4262lB+g==
X-Gm-Gg: ASbGncsJO1P9U9As4fD4L+ZOh0xstouT7F9ofxrfqLbHqG/gpkkoR6Mv70L34u+qZkO
 uophrLS+EhP3WchdgyKosqzbSUtbSuHH2hTp0qD7rr7KNVI0022tolrOy6T5m1djEsgYTmax+Wg
 YeTg86R9cBuvtEu0X6BSAMmb2YMy/jVIlPG0MqANHzWPkoIVeNt/hVqoowNW0vlYz45iw=
X-Received: by 2002:a05:7300:c8c7:b0:2a4:3592:cf6b with SMTP id
 5a478bee46e88-2a9415adb83mr8454184eec.15.1764314496924; 
 Thu, 27 Nov 2025 23:21:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrMtJeU8mifOKGBIMn9psEJkiAB94wE2JibU/tWQEhbwlctv7jDL4E4QEF0XjdkewXtwJQZu+1p8amFjk7aVM=
X-Received: by 2002:a05:7300:c8c7:b0:2a4:3592:cf6b with SMTP id
 5a478bee46e88-2a9415adb83mr8454165eec.15.1764314496210; Thu, 27 Nov 2025
 23:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20251126083305.228598-1-fangqiurong@kylinos.cn>
In-Reply-To: <20251126083305.228598-1-fangqiurong@kylinos.cn>
Date: Fri, 28 Nov 2025 15:21:22 +0800
X-Gm-Features: AWmQ_bkGKOFa9bZKD33q07QRYxloW6d8i7mThjwYagSSgq0Ri2kP4RfTnJo9kp0
Message-ID: <CAEemH2cm7isKtOkwvVTHXRTOxMu35VPTSTOU6f+K=qWTXTFPxA@mail.gmail.com>
To: fangqiurong <fangqiurong@kylinos.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 09m1USDiCUuDegTTvW07Yyy9b45XqCOZ_XLM1wpRYx0_1764314498
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] syscalls: add RT group scheduling check to
 sched_setparam03
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Qiurong,

I adjusted the patch description and moved all the checks to the
setup() function, then pushed it. Thanks!


-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
