Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CABACA6DADA
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Mar 2025 14:09:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1742821773; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=Ba2qmF7vd5pwUgAj4wbwVn4eIidltWUzcjglRvImbcE=;
 b=jAFvmejdRYm8L8LxCIbRA+adGwu1Chbsu6D7vdA3Lx/P8Fk70R2vcSQtzC30KuQO8B4qa
 DJ4LquyIAOHbgaH6MrC++u7YdEO8RS3ABeFr4Dllf+c6hzlzl8qqlKrEnuHu9/9zyJdxwjM
 stHh8VeILwUzWrfLDTTIYNSd3Ble9bI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BA443C8FB3
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Mar 2025 14:09:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC9443C85D0
 for <ltp@lists.linux.it>; Mon, 24 Mar 2025 14:09:19 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwan@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3E4F01400DFD
 for <ltp@lists.linux.it>; Mon, 24 Mar 2025 14:09:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742821757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IN+oiW6/WXEKFuuKKjGxcPGPYMclAXpm/xYSorYKQiM=;
 b=Q0qlfVLV6nVz20SpOqpuVfsYTEY7OoCEo3Pum40B2Q6SmUiXXDVRTW7xeFyPy7PK8gP6ON
 zjKcsDCGjQI50boE7Sv7AM6+OyD4anQIjs/zGVjA3T6gGF2zpeDpCijL0q0u37qI3ZIRzi
 oEa++4FrSf7e4lXudnNUx7DOiyCY12c=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-rxIYmEkxNsK-_OQhGnmKLA-1; Mon, 24 Mar 2025 09:09:15 -0400
X-MC-Unique: rxIYmEkxNsK-_OQhGnmKLA-1
X-Mimecast-MFC-AGG-ID: rxIYmEkxNsK-_OQhGnmKLA_1742821754
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff8a2c7912so7284428a91.1
 for <ltp@lists.linux.it>; Mon, 24 Mar 2025 06:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742821752; x=1743426552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IN+oiW6/WXEKFuuKKjGxcPGPYMclAXpm/xYSorYKQiM=;
 b=O9emgocF1tUfRGnj5KAYpvRX1qC45iPqAvaxlXpp/rxY9bf7Qgq3a7eLInGbzifGoq
 TyhsNnC86QyhtWpF24usgtAa4ZZsjWJIc14yL6Kk+CgOzhV8z+lSJmmYP9KBOsq8kBke
 7FEUV1QguGRgFjvuQyu2IvmTV+B7gmfG9sWBazK+4lXW+QxseXRdsfkWJIHKBsvWBbd4
 8HCotj7JjlG5rrPfqZNi5V8OQX406TONIsHThTiTH/PnYFLZhMFY9xWwm/FOgOWt9lkm
 H5m20cQZXAoiTrFGeq+uOVf61wftQykrHUgVwC0lweD8lwbvUhPWQEe5+vh0rgM3aKOZ
 /CLg==
X-Gm-Message-State: AOJu0Yx+vM3DXsWJUFB6KqTMJOWYKwm8m2TQnEDfMb3lw0VP967WFRc+
 ne63i4R4cRCOa3EMSuswL78wVCZzPO0WtFNt6cWMGEqkJHUOJd24r8KpdTwBLbw1zNdw5n6Bhtj
 xNKsyH4KHub8boENEE19rEFNuH0EOi++aJyDyHlMWahD2Ckm2VjvOqdZLKYWLRhVwxMD9DSSSdj
 8elvALTVfeTlsqJqOyevThsqsgSxM/gSWTUA==
X-Gm-Gg: ASbGncv2pdmp2ML6jZfaehv/HvYgWdkn6jyz57aRKE101zmH9625GI+zsA6BAPXsMDY
 2tCdYe3nTl380e5I6zoVm3Hviu9LodFi/dtozdnz7jayqEDc+x3Dbr/ngiK2wNZZOutMHfBJZKA
 ==
X-Received: by 2002:a17:90b:3810:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-301d42c50b9mr26844561a91.7.1742821752262; 
 Mon, 24 Mar 2025 06:09:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4bLIl3Yt8VKmgt/egVlL0V7xrBejGjeOQ/xp+r3UA+nhZTw/2Hr3Ex+qteakO0VvrIi9C8whTZBjF7ZcfTuI=
X-Received: by 2002:a17:90b:3810:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-301d42c50b9mr26844523a91.7.1742821751859; Mon, 24 Mar 2025
 06:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250321131621.1870655-1-liwang@redhat.com>
In-Reply-To: <20250321131621.1870655-1-liwang@redhat.com>
Date: Mon, 24 Mar 2025 21:08:59 +0800
X-Gm-Features: AQ5f1JpAG1JKE48ktNIor7RXKNTk_aZ2n_DxENTIncA6l71hynp1scWrFIrSz2g
Message-ID: <CAEemH2eUDYC6HCCbWacEqD-wpvawZBUGrsRTHaAHB3YppDfe3g@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mg_wHRoAWNCtR0wWAf_VjpVHLDJJkVRJL5EMJKCzo7Y_1742821754
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] shell_loader_filesystems: add tmpfs support to
 avoid fail in GitHub CI
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

Patch merged to get rid of CI failures.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
