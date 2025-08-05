Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95028B1B33C
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Aug 2025 14:22:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1754396576; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=O37TB4zgsaL4yAsF5SlLgJU1YGmv09SiFKYSDN+EbdA=;
 b=X8FVK/UeSySnm/RkayM6YX7CBSTXXVIm6jF3pvYEDFKO9pfbcXaoTp9T7mtEGfEB28Bmx
 Y27LMn/ONvHXjYxskbcco/q/5QH1l5+URrTnjrfU0j128fVLRQdW46txft/2zfzobln7oUw
 w2OTvMb8n0MKt7oJT4rmhRxPsqGD0Wg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D6A43C293A
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Aug 2025 14:22:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A78673C2707
 for <ltp@lists.linux.it>; Tue,  5 Aug 2025 14:22:54 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9D7BD60024C
 for <ltp@lists.linux.it>; Tue,  5 Aug 2025 14:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754396571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MXeCIYTVxlVrV91aQ6QIjcnt91R6f527Id72myrir98=;
 b=edUg7lHbkpvniS/RuW2i/R9tSa+7gO4T2vGstAmmMuGn69JFf02WnI16/Cip7xNhDRGbWw
 /yczw95pCYyUlGeRphjdznwcDKHLLqOROdDu0CciagOMvW3hSYO0x3ttMHleGsU93Hj2lU
 c+tv3bMaWRMfd+iDPWlrilEFPn1XUBY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-5qp8kfWLN6W4hyAIjS2FDA-1; Tue, 05 Aug 2025 08:22:50 -0400
X-MC-Unique: 5qp8kfWLN6W4hyAIjS2FDA-1
X-Mimecast-MFC-AGG-ID: 5qp8kfWLN6W4hyAIjS2FDA_1754396569
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2420cfdafcaso46769975ad.0
 for <ltp@lists.linux.it>; Tue, 05 Aug 2025 05:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754396569; x=1755001369;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MXeCIYTVxlVrV91aQ6QIjcnt91R6f527Id72myrir98=;
 b=KdYRLoPT/hGnAZfUCuGLU2O3qEj+q9l3F+hZwti0q10paMcir/FXcFd69YfMMgG+bT
 eSUqRFiXxa8f4T6RwpbcCg6b1aVVGBJX7GBGbYWxyUcszrv3eQQO6/9zcEGBdp8GW7zd
 LC86b+efqAgiiDSnowx9RW/f1lAFo4g30nt+sJzPKIJwMQo3oZZbQq6pPmC32vtfd5h6
 +u4eMTgSNc2CxdtRCjGBkfs5ff5Iba2FEmulzdCJ+XXYKQmdTUopLfS539QZrjagpbPa
 l+L0jHqjtV7wahZ2Vm57zkBImhs2aD2ro78fcrGWQxqQ29ehr//aQm0FuckFj4+G4cAM
 cxJA==
X-Gm-Message-State: AOJu0YynPT6P74q93XxvteY1iBmXJwB+DcZEtsgt/yFSrYSCCLrYjV3y
 +D4iOiwBEIDhztXeTfEuNvcjTkZZcRADCZnroZBElcQOL0EEvCDlAUmDs78zyp749QxXDpzK+mp
 GFo460s3ny54kDiHxnLThvP47i+YxDnnJ16HSJcb4kh7Qk5gntHGCqhV62mBZc5WhR4NupFc+k/
 2XR494VEMZsdAyOAj3FvsxJem1pFg=
X-Gm-Gg: ASbGnctYlpkwEpbbLkZ2hwFfQeIJ29cNScY7/0yY+KXsds0jdd1v/5Cxdi51i4dfC03
 jGkf9nUBo4g0x1m+H4j4/0gXeGPgBoJFSLieZRV2TeTLYPUSEUbl6zwEiMBJ6ULCKl1EYGYFigs
 ML0CPBjZKZeKFPXGkRmtp8Xw==
X-Received: by 2002:a17:902:c402:b0:240:5523:6658 with SMTP id
 d9443c01a7336-24246febadbmr232905265ad.29.1754396569155; 
 Tue, 05 Aug 2025 05:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpE96seQS9DtwYGDw1auChXo80EGntrI5f4lN8e0DV9dwGr0gNvlb4AQhm9RLpJJmn4pKF2++hM9meSEuw2k0=
X-Received: by 2002:a17:902:c402:b0:240:5523:6658 with SMTP id
 d9443c01a7336-24246febadbmr232904785ad.29.1754396568748; Tue, 05 Aug 2025
 05:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250802032123.26335-1-liwang@redhat.com>
 <20250805114030.GB270562@pevik>
In-Reply-To: <20250805114030.GB270562@pevik>
Date: Tue, 5 Aug 2025 20:22:36 +0800
X-Gm-Features: Ac12FXziiBYLZWcnoKkVGEH0HDzqC6qFwR8OnEJ7Nr8kZ0__Ebbqkr4ZZbDAsLI
Message-ID: <CAEemH2fZT058N3zdjoopxwUord+Oqz62K7ofF1E5CN5DQ86u5w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Ck35fo3uU3_rFf2gTlBzUm2gYgyV31Jl7fGM8N963c_1754396569
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] mk: fix typo in module.mk
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBBdWcgNSwgMjAyNSBhdCA3OjQw4oCvUE0gUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2Uu
Y3o+IHdyb3RlOgoKPiBIaSBMaSwKPgo+ID4gICQoaWYgJChSRVFfVkVSU0lPTl9NQUpPUiksLCQo
ZXJyb3IgWW91IG11c3QgZGVmaW5lIFJFUV9WRVJTSU9OX01BSk9SKSkKPiA+IC0kKGlmICQoUkVR
X1ZFUlNJT05fUEFUQ0gpLCwkKGVycm9yIFlvdSBtdXN0IGRlZmluZSBSRVFfVkVSU0lPTl9NSU5P
UikpCj4gPiArJChpZiAkKFJFUV9WRVJTSU9OX1BBVENIKSwsJChlcnJvciBZb3UgbXVzdCBkZWZp
bmUgUkVRX1ZFUlNJT05fUEFUQ0gpKQo+Cj4gR29vZCBjYXRjaCEKPgo+IFJldmlld2VkLWJ5OiBQ
ZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KPgoKTWVyZ2VkLCB0aGFua3MhCgotLSAKUmVnYXJk
cywKTGkgV2FuZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
