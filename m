Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E679C66C8
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2024 02:37:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1731461852; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=E0V3VSbEo5s4kv9t0qMiVVsjlim2bQ8zbRxXNNtZgX0=;
 b=Bi9GhSRYkS7ldlx/Kk/l899TcAjv6leZo0Z2eByfV3YxreYPfeDANMrjlvarjERznuO/0
 zsXFMNJU/8rW7iy3IaYAimuNxFCUNmmkLm0qpMDx0AhzqHmRftsxPAUQJCzdRcVzzjwZNeI
 Nn83b0eoHhouZJHGg6KC50Yb0Kwcy5A=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C7B13D63E1
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2024 02:37:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 519E93D63D8
 for <ltp@lists.linux.it>; Wed, 13 Nov 2024 02:37:31 +0100 (CET)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B2869118256A
 for <ltp@lists.linux.it>; Wed, 13 Nov 2024 02:37:29 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5cedf5fe237so7702287a12.3
 for <ltp@lists.linux.it>; Tue, 12 Nov 2024 17:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1731461849; x=1732066649; darn=lists.linux.it;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HTY5yvQsKcmJw/LqaDS3oKebxcuTEOgMgrRuC2JXLC8=;
 b=J8FmfvghXXIF618T1LYEXQE3g8/DwplYLPtXAr9YkahXpw9qEqxq8A0vKrzThYli9H
 q9CSjmAdN/PY6HaXAAKsFtP3713x+IHuIY0QW5jyiihoIm/Ym2rAyqZQ3X/kLBR/07hW
 ECsGQ0qsZyroPTjk8PE9K8CvK4e2reKZkGjYAbjuRQCf1402kag2aHdLEnqLMEJaUgCB
 hNZxA7ER2tKt2w6aviKNgUFZ4VRuIeElyvuv2+qBiG8doAbVYb8D7S5/1WeViN6ZXADU
 hxDiP2sitP2pv2UJ6Emf05FLbyW2IH5ZhZdXDagDFfQTpAKz0BZYt8etLijZhah377Aj
 rdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731461849; x=1732066649;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HTY5yvQsKcmJw/LqaDS3oKebxcuTEOgMgrRuC2JXLC8=;
 b=KUO9NLD1C6xCq6xrl9u8eMaTsCLb74LelWvJm5lYIa3SH2AzuJdJjBq2MUW7ohXjji
 3XH8bp+HUT/2RboOiQh/nlQKYsf61KxsN8VRHCK49xOzFImCUrZi6zFv879iaWX4lVoM
 fscXDqF8wdfS5rTefqVy3hLU+JmcMCBNrn8RsIYlrRiNaxE/aAuXeJlI+fcfmqBP2hVb
 yENQk+x9DtAg/dA1BN5YBYxbfnv5VA2mdgn2qVxE3yfLrkSWCkGRZo0uvJ1AN64GlUla
 4J7BqwHU2vO0mWTbgmJl0dOw/mdRLBjJ3wEY4F8GARCeSwdjuzO92vn9vt8QI2xHykiS
 v/zA==
X-Gm-Message-State: AOJu0YxozhY8lViknsOJMimG/pYpQEfR1oxdxSRsT47KBbDooFOSCPI9
 mkzevgSxzl8LO0PkaKss0TEJzmMdkz7X6t7IFn6UYJG8hrGL9h5k2QjPEY1sjA==
X-Google-Smtp-Source: AGHT+IH2J+hlz3EMKM6fafv/BtQYz/sEVSCeFTbWAjathKOfbJ/BGyL9dbFEXAwkQ6gJzSWlJpQ+Kg==
X-Received: by 2002:a05:6402:40d2:b0:5ce:af8e:d0a6 with SMTP id
 4fb4d7f45d1cf-5cf0a310147mr15557152a12.4.1731461849010; 
 Tue, 12 Nov 2024 17:37:29 -0800 (PST)
Received: from wegao ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03bb5890sm6700152a12.37.2024.11.12.17.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 17:37:28 -0800 (PST)
Date: Tue, 12 Nov 2024 20:37:22 -0500
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZzQC0vMtMaK0+nQU@wegao>
References: <20241112171831.156440-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241112171831.156440-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] mq_timedreceive01: Fix different signedness
 error on 32bit
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBOb3YgMTIsIDIwMjQgYXQgMDY6MTg6MzBQTSArMDEwMCwgUGV0ciBWb3JlbCB3cm90
ZToKPiB3YXJuaW5nOiBjb21wYXJpc29uIG9mIGludGVnZXIgZXhwcmVzc2lvbnMgb2YgZGlmZmVy
ZW50IHNpZ25lZG5lc3M6Cj4g4oCYdW5zaWduZWQgaW504oCZIGFuZCDigJhsb25nIGludOKAmSBb
LVdzaWduLWNvbXBhcmVdLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBz
dXNlLmN6Pgo+IC0tLQo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL21xX3RpbWVkcmVjZWl2
ZS9tcV90aW1lZHJlY2VpdmUwMS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9tcV90aW1lZHJlY2VpdmUvbXFfdGltZWRyZWNlaXZlMDEuYyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvbXFfdGltZWRyZWNlaXZlL21xX3RpbWVkcmVjZWl2ZTAxLmMKPiBpbmRl
eCAzODcwYjQwODdhLi5kNGY0NDdkMDQ3IDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvbXFfdGltZWRyZWNlaXZlL21xX3RpbWVkcmVjZWl2ZTAxLmMKPiArKysgYi90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL21xX3RpbWVkcmVjZWl2ZS9tcV90aW1lZHJlY2VpdmUwMS5j
Cj4gQEAgLTE4Myw3ICsxODMsNyBAQCBzdGF0aWMgdm9pZCBkb190ZXN0KHVuc2lnbmVkIGludCBp
KQo+ICAJCXJldHVybjsKPiAgCX0KPiAgCj4gLQlpZiAodGMtPmxlbiAhPSBUU1RfUkVUKSB7Cj4g
KwlpZiAoKGxvbmcpdGMtPmxlbiAhPSBUU1RfUkVUKSB7Cj4gIAkJdHN0X3JlcyhURkFJTCwgIm1x
X3RpbWVkcmVjZWl2ZSgpIHdyb25nIGxlbmd0aCAlbGQsIGV4cGVjdGVkICV1IiwKPiAgCQkJVFNU
X1JFVCwgdGMtPmxlbik7Cj4gIAkJcmV0dXJuOwpSZXZpZXdlZC1ieTogV2VpIEdhbyA8d2VnYW9A
c3VzZS5jb20+Cj4gLS0gCj4gMi40Ny4wCj4gCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
