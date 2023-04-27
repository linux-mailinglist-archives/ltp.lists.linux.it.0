Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDE86F0ACE
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Apr 2023 19:25:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA33F3CE943
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Apr 2023 19:25:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8C4FC3CB1F5
 for <ltp@lists.linux.it>; Thu, 27 Apr 2023 19:25:24 +0200 (CEST)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 179851A00248
 for <ltp@lists.linux.it>; Thu, 27 Apr 2023 19:25:24 +0200 (CEST)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-3ef36d814a5so767921cf.0
 for <ltp@lists.linux.it>; Thu, 27 Apr 2023 10:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682616323; x=1685208323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w+ABa3LHbERUDAoeDB/qWatuW4wfbAroi2O351TSJOY=;
 b=oLcafD7KOQkGwZKj9Y/1QX4K6dVkfXYjfQ5zt8Ur11ArSpuKArmp8BgEEUAkQqztoq
 2F5R8XPoShMU36e945H1dPCVUAc02NtH0jkq/OmZrZwjmVhIm7OTMKIUB1DeR4gPlXlb
 TAN1PTV0w6+HNBDfFC/NG/veV56avhuctHfQPd1CDwdNPKN6tDT90wr/PqnHjYRZ9q6g
 cYI+XBe+O9sNcrqTG0jTxQvwMSPLaGBkznK+sUqiMgkQDyFzbR+gnc5zWt3/msIho+He
 JPHzM2fNPAXG9msE87kSTlyfMqy0unpqVmOdKp/DRPd+Qy0+lj59K9Y061PGDmWGP4sw
 VaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682616323; x=1685208323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+ABa3LHbERUDAoeDB/qWatuW4wfbAroi2O351TSJOY=;
 b=kFn3D5QhtiZJF+mJ4GS10zr8csvdBIhKUqsXXufiNhnLQLgT1GBdvIvUoFGKrMwFLX
 OLCsPXgXN8E+MaPvwNEqGTGW/96rksa5l7lHgc/930IkFH7OIMgd4wMu/EsW3lETMNRW
 l0sbo1EFtTLw9J4pV4qeviGiiR763wu713bYgFBt06E2ojfhpyucQdYAABmSi2yFJB3z
 MznLJJWdlAsLjqwzX8hBm9gpkLcVzisbtn0ibAM1YqoO8bGYDnVtxX5Cs0SvmBcjM+kw
 LOO4KUKuiMX0NbSUB5jxNTIBsAs6cAkfYKYlqiork1D/vcD1wYl57FHVaHY5YpEOd2qU
 f77Q==
X-Gm-Message-State: AC+VfDyBM1BScYpclMx1344GvaD2HvT0odHbk0wI7h4lhKgfCtc9wUPJ
 OkCAkkHgJBwcHJT2yZ5wBMuxetYBJFulROjBLUkYeA==
X-Google-Smtp-Source: ACHHUZ7womYrl1JFYvdi4R93DrdJqHhPycIzMI3vEQssUc+9w63WnnSJeW79x2a8pqf6xd73aK+VwjbZgXQXdzi7i/w=
X-Received: by 2002:a05:622a:1a03:b0:3de:1aaa:42f5 with SMTP id
 f3-20020a05622a1a0300b003de1aaa42f5mr325774qtb.15.1682616322761; Thu, 27 Apr
 2023 10:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230427002905.1354207-1-edliaw@google.com>
 <20230427002905.1354207-2-edliaw@google.com>
 <20230427093531.GA3127067@pevik>
In-Reply-To: <20230427093531.GA3127067@pevik>
Date: Thu, 27 Apr 2023 10:24:56 -0700
Message-ID: <CAG4es9VFfgMQZWO+YLW3YFKTfpDdT2RybHJ5o9TtJr-0dUeF9w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/2] fcntl{34,
 36}: Only use fcntl64 with 32bit abi
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com, rpalethorpe@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCBBcHIgMjcsIDIwMjMgYXQgMjozNeKAr0FNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6PiB3cm90ZToKPgo+IEhpIEVkd2FyZCwKPgo+ID4gRml4ZXM6IDc2NDMxMTVhYWFjYiAoImZj
bnRsezM0LDM2fTogQWx3YXlzIHVzZSA2NC1iaXQgZmxvY2sgc3RydWN0IHRvIGF2b2lkIEVJTlZB
TCIpCj4KPiA+IE9uIEFuZHJvaWQgYXJtNjQsIHRzdF9rZXJuZWxfYml0cyBpcyBkaXNyZWdhcmRp
bmcgdGhlIGFiaSwgc28gY29tcGlsaW5nCj4gV2hhdCBleGFjdGx5IGRvIHlvdSBtZWFuIGJ5ICJk
aXNyZWdhcmRpbmcgdGhlIGFiaSI/IFdoeSBpcyBhYXJjaDY0IGRpZmZlcmVudD8KCkluIHg4Ni9l
bnRyeS9zeXNjYWxscy9zeXNjYWxsXzMyLnRibCwgYSA2NGJpdCBrZXJuZWwgdXNlcwpjb21wYXRf
c3lzX2ZjbnRsNjQsIHdoaWNoIGlzIGZsb2NrNjQgY29tcGF0aWJsZTsgd2hlcmVhcyBpbgphcm0v
dG9vbHMvc3lzY2FsbC50YmwgaXQgdXNlcyBzeXNfZmNudGwsIHdoaWNoIGlzIG5vdCBmbG9jazY0
CmNvbXBhdGlibGUuCgo+IE9uY2Ugd2UgcmVtb3ZlZCB0c3Rfa2VybmVsX2JpdHMoKSwgdGhlcmUg
aXMgbm8gbmVlZCB0byBwYXNzICJmY250bDY0IiBhcyAlcywKPiB0aHVzIGl0IHNob3VsZCBiZToK
Pgo+ICAgICAgICAgICAgICAgICAgImZjbnRsNjQoJWQsICVzLCB7ICVkLCAlZCwgJSJQUklkNjQi
LCAlIlBSSWQ2NCIsICVkIH0pIiwKPiAgICAgICAgICAgICAgICAgIGZkLCBjbWRfbmFtZSwgbDY0
LmxfdHlwZSwgbDY0Lmxfd2hlbmNlLCBsNjQubF9zdGFydCwgbDY0LmxfbGVuLAo+ICAgICAgICAg
ICAgICAgICAgbDY0LmxfcGlkKTsKPgo+IE90aGVyd2lzZSBMR1RNLgoKU291bmRzIGdvb2QsIEkg
d2lsbCBzZW5kIGEgdjIuCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
