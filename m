Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 542F6AC46A2
	for <lists+linux-ltp@lfdr.de>; Tue, 27 May 2025 04:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1748314595; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=NOgzoIMvcGF3/peo4mZBm+IElpC5LpisnRRl13yrW1c=;
 b=EwILBy00WSMlvxXs3RkI0gJxjP82NQmxyWm40GmCCfxCHghkzgbwISQxj/AytS7KTxgBI
 Ef40CZB2AD1Jg/kfNKHzDvZigVaRadvg+rJ1ftwn4OzcHticOoX4M6x6LG1GvdWMfJqSpRB
 TA/k7XtBCPwEuOokYZ6b5FDFWQVx+6A=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5AA93C4CE4
	for <lists+linux-ltp@lfdr.de>; Tue, 27 May 2025 04:56:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8699D3C0131
 for <ltp@lists.linux.it>; Tue, 27 May 2025 04:56:32 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 68A3C1A00F35
 for <ltp@lists.linux.it>; Tue, 27 May 2025 04:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748314590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q40JDoXA7dEgMcDQYLVInJx4gkUSyDS8vT7MpvD+Jxg=;
 b=SC9B1dsGPLEhQYwQO4AZhcg9CSTofZuJoOumxbKfxw2P5os6KH337aCjGKPkxZtvrgjtuy
 Q56tbUBD9xAWqVlFDsj7AimbF8Ek6LA4zbqFpRz4LboX6At8mYIWm9zuImlqhpPCRXATpv
 75n6TyrVneDLE5Uz6uMba+zL6L3pK3g=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-aHBO1x2lNPOBQ3SdHrWCuQ-1; Mon, 26 May 2025 22:56:28 -0400
X-MC-Unique: aHBO1x2lNPOBQ3SdHrWCuQ-1
X-Mimecast-MFC-AGG-ID: aHBO1x2lNPOBQ3SdHrWCuQ_1748314587
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3110462b463so2987553a91.1
 for <ltp@lists.linux.it>; Mon, 26 May 2025 19:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748314587; x=1748919387;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q40JDoXA7dEgMcDQYLVInJx4gkUSyDS8vT7MpvD+Jxg=;
 b=LqRExTFPU47IPavSsquYtwbt3g0w5m6VZMjSmDioTFXDkmB3Eom9mDCNWhJQrQ7gYN
 R6TT4bp6IQUHGPHpb+ZG6Lm0c2iZb6o6PUs/s0STVv9P+I1Bu0WHY4QNMYmtJBGJTutT
 BfGLjwk6wnfFKCmBm+rmy2dnAwgB9szTML/F+OqovMF8gYlx9bkgiRE17SRI/wK4tEyU
 SP+RrHbSl1tBOZuQOt8uDWVeDdTiMge0Dv2kTL30eMuD9KtcMiC/UzRVCthZ/Lypa+jU
 Ovzib4e4hBVQ6dOSJAETlLUIdFEGFpg7bZOpd79e0mQh8AFdi/01vGIQSRZX8Lvn9NG+
 +mOw==
X-Gm-Message-State: AOJu0YwaritrQFXmkraABW/eEnDjvIlqjlXvBKdbOA/ez7aDBXJ5gghr
 QwTWU8MKItHfaWB4qGeWDlPtu2CK5uGLhaawujGR2UhWx21XrFY7v1gppoH+9RCJQ+w2p/vsp7/
 tFIr8VYRZRBa3X6dtAQRSlcZrsxvfgLpsApSe1+lo+sw5brDakf0ic4JAfRwavrxkRKbG8Sl2nN
 FUvmfv4BdGLxLZS3PkjqxLgmODBbU=
X-Gm-Gg: ASbGncvXnDvoUaidKxqzFCOpzTBIPtIFBzSEoAbbSEM2fKmRQFhxCVA9rWcmBgmh6hs
 dUxuH6idpsVEdAgnBq0KrGmZj+vFoZ4BJTD85sV5yzuUNYtUcQEvOQ5ScUUi2PJBfUBDnXg==
X-Received: by 2002:a17:90b:55cb:b0:2ff:784b:ffe with SMTP id
 98e67ed59e1d1-3110f82417emr18315824a91.11.1748314587203; 
 Mon, 26 May 2025 19:56:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC8rwdGl66YqBj+XZi6ZpIWk3Bzd3jhwTiiOL17Sp9R8f/E0OOdqbcRINKqvGIhiTOInTKax6JIM9+FhmCvLg=
X-Received: by 2002:a17:90b:55cb:b0:2ff:784b:ffe with SMTP id
 98e67ed59e1d1-3110f82417emr18315810a91.11.1748314586842; Mon, 26 May 2025
 19:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250526144721.144011-1-pvorel@suse.cz>
In-Reply-To: <20250526144721.144011-1-pvorel@suse.cz>
Date: Tue, 27 May 2025 10:56:14 +0800
X-Gm-Features: AX0GCFvhmQz90T_rdfRgg2n_44hgE1mINS_StkMJ44Dnjbk7wyb6WK-j83q6Xa0
Message-ID: <CAEemH2f67epeafnYGtxEWHygPTuo4AL4TNTJbJH8gLrq9VrsuA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nd9_GfaoRc_oF7ki6mvUlFP-5lckTmeLmK7Do5O2fx0_1748314587
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] test_controllers: Remove cpuacct
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
Cc: =?UTF-8?Q?Ricardo_B_=2E_Marli=C3=A8re?= <rbm@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Good catch!

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
