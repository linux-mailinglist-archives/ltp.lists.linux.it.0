Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D75A36AF8B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 10:12:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64B533C6741
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 10:12:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 23E143C1A7E
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 10:12:24 +0200 (CEST)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6D2D11400BEC
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 10:12:23 +0200 (CEST)
Received: by mail-pg1-x52b.google.com with SMTP id q10so39551674pgj.2
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 01:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=RjIDMgRaed8SWkHrSbKvmOvCa0VfBd2UpcNp55A2guE=;
 b=oHMG3omSZJqkvfZV8WhURZihnDf9Z0sxyR3zWqJNj/ACQq3Wj3o/ksgIu1Rad3doU8
 OPlJTDz62LDPeJSty6sKmRqbpnYh1w0sefW1EFxmcu3qKf+XKnkZ7+84k0CJ041nwIQE
 qi9aWBxcUT+//UouzE4OBzhRBSPODEa+g5M+TsqtERAW63yorRG6Fflxf0+puKpqKmeH
 lICJ8DIeDI/bjypOeFc5VjqbaIklDoNinI75BPfOaxxZTroLLYNpXC+nwFfwAAmUEfKc
 BzfBtG5RAjuYjI0Bu7eHLgqs9XLdKop9HTC3PAxzPG0SwT7cKPsT4TA0JEJbuOpb5aEO
 aotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=RjIDMgRaed8SWkHrSbKvmOvCa0VfBd2UpcNp55A2guE=;
 b=QxWV4DczOSMkavda4wbxeCP/RQ9kKCpb8hM+4ypZYgOhKZQvmYUj+2OXicM6xiwaPR
 3Wyl0zidZRwGyh/U1OTRU4/xZyjyTikBkU/CcyIANw4rkhVfQGzIpVyPcqllocD0ZuLR
 136x3qmQeNwZFv1I/1iVW2x/xFTP6M3KubZ0qrm4o4zGORb04AQJcuy2XGqZF4rfko9U
 syKk9FR26JdNIXGqUK0bpEQ6prSC6rsmlIPGaPJgbZBjfcuwgJc0VI/auOvMvMZDZ6iZ
 tBKqV5SjvGIlC43kBeYBKg1SEpFlL9TuLQoJ5eNzue2QId9u5R72XHzlOVOSNXKUWxnF
 8yFA==
X-Gm-Message-State: AOAM530rW9pjg7Hw2UmSt+1hrYtWSt6h5eb/Rz5vt8BSHU9Vbi38DvFe
 4o9Y3g/6r4wIcxjn7fijc9obhA==
X-Google-Smtp-Source: ABdhPJztY7Wz/WZcO3kBsJEeZKsKj09LrUY/EoDEvRWtE+gr+pbe2dNA9gCgeTA74hdHTRjvxXXYWg==
X-Received: by 2002:aa7:9add:0:b029:260:8c8a:91fb with SMTP id
 x29-20020aa79add0000b02902608c8a91fbmr16878224pfp.21.1619424741770; 
 Mon, 26 Apr 2021 01:12:21 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id b25sm10653612pfd.7.2021.04.26.01.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 01:12:21 -0700 (PDT)
Date: Mon, 26 Apr 2021 13:42:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <20210426081219.tvaoqd67vj26bfr3@vireshk-i7>
References: <20210422072609.9938-1-sujiaxun@uniontech.com>
 <YIZSzNd9uK8kItYb@pevik>
 <20210426055556.dmcogdykez2ddxn3@vireshk-i7>
 <YIZa4Ph81LmkEkLZ@pevik>
 <20210426062357.i72js3urkoofvzcj@vireshk-i7>
 <f06db611-5024-78d6-07e9-36115889b7a7@uniontech.com>
 <20210426070320.iow3avu2pq22qled@vireshk-i7>
 <827cdde8-18df-75b0-743c-7876704c2039@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <827cdde8-18df-75b0-743c-7876704c2039@uniontech.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix the 64-bit macro definition of mips
 architecture
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

T24gMjYtMDQtMjEsIDE1OjUzLCBzdWppYXh1biB3cm90ZToKPiAKPiAKPiBPbiAyMDIxLzQvMjYg
5LiL5Y2IMzowMywgVmlyZXNoIEt1bWFyIHdyb3RlOgo+ID4gT24gMjYtMDQtMjEsIDE1OjAwLCBz
dWppYXh1biB3cm90ZToKPiA+ID4gdW9zQHVvcy1QQzp+JCBlY2hvIHxnY2MgLWRNIC1FIC0gfCBn
cmVwIC1pIGFyY2gKPiA+ID4gI2RlZmluZSBfTUlQU19BUkNIICJtaXBzNjRyMiIKPiA+ID4gI2Rl
ZmluZSBfTUlQU19BUkNIX01JUFM2NFIyIDEKPiA+ID4gdW9zQHVvcy1QQzp+JCBlY2hvIHxnY2Mg
LWRNIC1FIC0gfCBncmVwIC1pIG1pcHM2NAo+ID4gPiAjZGVmaW5lIF9NSVBTX0lTQSBfTUlQU19J
U0FfTUlQUzY0Cj4gPiA+ICNkZWZpbmUgX01JUFNfVFVORSAibWlwczY0cjIiCj4gPiA+ICNkZWZp
bmUgX01JUFNfVFVORV9NSVBTNjRSMiAxCj4gPiA+ICNkZWZpbmUgX01JUFNfQVJDSCAibWlwczY0
cjIiCj4gPiA+ICNkZWZpbmUgX01JUFNfQVJDSF9NSVBTNjRSMiAxCj4gPiA+ICNkZWZpbmUgX19t
aXBzNjQgMQo+ID4gPiB1b3NAdW9zLVBDOn4kIHVuYW1lICAtbQo+ID4gPiBtaXBzNjQKPiA+ID4g
Cj4gPiA+IFRoZSBtaXBzIGFyY2hpdGVjdHVyZSBnY2MgaGFzIG5vIGJ1aWx0LWluIF9fYXJjaDY0
X18sIG9ubHkgX19taXBzNjQKPiA+ID4gZGVmaW5pdGlvbnMuIE9mIGNvdXJzZSwgIl9fQklUU19Q
RVJfTE9ORyA9PSA2NCIgY2FuIGFsc28gYmUgdXNlZCwgYnV0IEkKPiA+ID4gdGhpbmsgaXQgaXMg
YmV0dGVyIHRvIHVzZSBfX21pcHM2NCBpbiB0aGUgbWlwcyBhcmNoaXRlY3R1cmUuCj4gPiAKPiA+
IEhtbSwgSSB3aWxsIHJhdGhlciB0cnkgdG8gZG8gd2hhdCB0aGUga2VybmVsIHNvdXJjZSBjb2Rl
IGRvZXMsIGkuZS4KPiA+IHVzZSBfX0JJVFNfUEVSX0xPTkcgaGVyZSBpbnN0ZWFkLgo+ID4gCj4g
SSByZXN1Ym1pdHRlZCBhIHBhdGNoIGFuZCBjaGFuZ2VkICJfX2FyY2g2NF9fIiB0byAiI2lmIF9f
QklUU19QRVJfTE9ORyA9PQo+IDY0IiwgdGhlIGxpbmsgaXM6IGh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9sdHAvcGF0Y2gvMjAyMTA0MjYwNzQ4MTIuMjc3OTgtMS1zdWppYXh1
bkB1bmlvbnRlY2guY29tCgpZb3Ugc2hvdWxkIGhhdmUgY2MnZCBtZSBkaXJlY3RseSA6KAoKSSBk
b24ndCBoYXZlIHRoYXQgcGF0Y2ggaW4gbXkgaW5ib3guLgoKVGhvdWdoIHRoZSBwYXRjaCBsb29r
cyBmaW5lLgoKLS0gCnZpcmVzaAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
