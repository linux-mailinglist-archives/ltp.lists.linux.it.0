Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F98F3F9D12
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 18:56:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12E1B3C2DEA
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 18:56:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7CB163C29EF
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 18:56:20 +0200 (CEST)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E3FA91401227
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 18:56:19 +0200 (CEST)
Received: by mail-pg1-x52c.google.com with SMTP id w8so6445248pgf.5
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=CBd67DmWA1OHyW5fzH2Uyw7bYmdOu4uxgreoK+x/+dU=;
 b=RBe2n3QRw1MaE47dbRPc8s5MAcxVBKu4od8wIyV2iECiv+Or0Ugq09bWgzxtfAStgK
 K0ONBaubJWBL9gFA/PscBXpfOXGvKksI7XvqiqKvuVWWb8QqoBkpL/1bZsgwbA9ABwK2
 dVOMtwDV7ETPDwc2D/xw4qF9v+ZI0Pmw8njCrFDeRzi4F/wKEew0MNlNrX+JD0/WLOl/
 O0vbRMVU+ELzp3DInkMv4zGjzJva7FfhnT9/s3Mph0p72RMK3BAGKXeac1uT4XfwwHxL
 3yvLzjhAmQ0XGntHCnEKW7/b/FnmxvvQSTtq7ToLsTMGPyy3jlSr6z3h/heVhBPLxXfl
 SiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=CBd67DmWA1OHyW5fzH2Uyw7bYmdOu4uxgreoK+x/+dU=;
 b=m3U5NL7MRfr1aKRVzGayZbPS19iu4YHDGLeKh6W0co6b3v9VQdDwRgOhxxj6MLPELk
 A5MFnUmbShkv8mNBngGEJZ8u0KC/Zp1yAP0A/bigMz7OWJCzQ3F6gNw+Lz2ngmlqII2P
 OZATD6jES3OQotU7sDdhyBeGPtPixOFdyC2koGvnxOXdRogoynZqJMUoTOLe+9cl0HoK
 z8ADczbq9T8Q4dCUTQkRsW1nvEGHuX6H3MJNoZKKcVdsw0JTOHJ4XIltbW0hXQQsC7b+
 a8fr0k7YAcDuV1s8CXVmsaOAyfcYZD+mJTFxP6hp5EM8jdh/9BdxaxEFt/8vAgUApScY
 /o2Q==
X-Gm-Message-State: AOAM5319X+jB4JlAm2BN+uFJ2qmGWBF6R9n9oDxN5yG2Gk91wvi0XaOt
 d1wazZl1MLUv23AdQc3sx6g=
X-Google-Smtp-Source: ABdhPJyCtZaQ6kkSCy22idk8GZ+975+Xpa5S7StyX/QjurrJIA8VCwFD5Tn83/bx9CFJChPiuwsb9Q==
X-Received: by 2002:a63:1748:: with SMTP id 8mr8686418pgx.350.1630083378345;
 Fri, 27 Aug 2021 09:56:18 -0700 (PDT)
Received: from smtpclient.apple (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id z2sm7856909pgb.33.2021.08.27.09.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 09:56:17 -0700 (PDT)
From: Enji Cooper <yaneurabeya@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 27 Aug 2021 09:56:17 -0700
Message-Id: <3C6F0AF8-B0CA-49A4-8A3D-A980EFF136EE@gmail.com>
References: <YSjhgaJE3v8odUhF@pevik>
In-Reply-To: <YSjhgaJE3v8odUhF@pevik>
To: Petr Vorel <pvorel@suse.cz>
X-Mailer: iPhone Mail (18G82)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] scripts: Remove legacy script tests
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

QUNLLgoKPiBPbiBBdWcgMjcsIDIwMjEsIGF0IDA1OjU4LCBQZXRyIFZvcmVsIDxwdm9yZWxAc3Vz
ZS5jej4gd3JvdGU6Cj4gCj4g77u/SGksCj4gCj4gYW5kIEkgc3VwcG9zZSwgd2UgY291bGQgcmVt
b3ZlIGFsc28gZGV0ZWN0X2Rpc3Ryby5zaCAod2UgaGF2ZSBsc2ItcmVsZWFzZQo+IG5vd2FkYXlz
KSBhbmQgZ2l0MmNoYW5nZWxvZy5zaCAod2Ugd3JpdGUgcmVsZWFzZSBub3RlcyBtYW51YWxseSku
Cj4gCj4gS2luZCByZWdhcmRzLAo+IFBldHIKPiAKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
