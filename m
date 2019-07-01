Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C4B5BB85
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 14:30:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A84FE3C1D77
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 14:30:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 724FE3C1D0B
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 14:02:37 +0200 (CEST)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 78B8114010E2
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 14:02:37 +0200 (CEST)
Received: by mail-wm1-f67.google.com with SMTP id v19so15618279wmj.5
 for <ltp@lists.linux.it>; Mon, 01 Jul 2019 05:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7tQhKzs59ZO+mk5DflBxUJRkH1TY98DdollEajrbPNc=;
 b=b102GVZ5KPVs8HNhwfgaFL+XFMnETxKAnPXCscGK0oceMeEP9KA3PH5Nue8N/KgwPO
 D2+0gAeOtdfAyeOhA/CxgnLLcHMvccn/JlzVMjgAaudxFAmn9f6uOHY7Pr0S2ZOKoebS
 zFV3NhgE0dR4imGoEOUA0yKCqrBIzppQXGZ3LnCWrTykaaAfjqWuHypeJ2ZByh7pPIY0
 rfOt1QC9Wda+8SJwx+7uhGoOmMhKq1eDw7Rxq3Fp1GbLtIMP5qV6grcy7hddEFyWmYhm
 h1RO0Pab8XHAlkHm4B+06UdYRXayx0QlL91yo3DE201TkT3gheNBWlCuMfC/9/+QOwke
 uT8w==
X-Gm-Message-State: APjAAAWes6KDHICPSBrU5+5GLdx9eGGPNsErY7GE/Md1PmWPy4xM8vxI
 KsjGOV89H7HUd7NJWah4Ad3axA==
X-Google-Smtp-Source: APXvYqwNj/ZV25WU1NwD38ax6MSpDuhlv1dnFFf7FmXQzltR4cECI04ABeVz55YT2fuFIf9xwhZjVQ==
X-Received: by 2002:a1c:a186:: with SMTP id k128mr7622557wme.74.1561982556801; 
 Mon, 01 Jul 2019 05:02:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d4d:4830:bcdf:9bf9?
 ([2001:b07:6468:f312:5d4d:4830:bcdf:9bf9])
 by smtp.gmail.com with ESMTPSA id v12sm8306849wrr.41.2019.07.01.05.02.35
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 05:02:36 -0700 (PDT)
To: Li Wang <liwang@redhat.com>, ricardo.neri-calderon@linux.intel.com,
 tglx@linutronix.de, kernellwp@gmail.com, ricardo.neri@intel.com,
 pengfei.xu@intel.com
References: <CAEemH2cg01cdz=amrCWU00Xof9+cxmfR_DqCBaQe36QoGsakmA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5622c0ac-236f-4e3e-a132-c8d3bd8fadc4@redhat.com>
Date: Mon, 1 Jul 2019 14:02:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAEemH2cg01cdz=amrCWU00Xof9+cxmfR_DqCBaQe36QoGsakmA@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 01 Jul 2019 14:30:32 +0200
Subject: Re: [LTP] [Kernel BUG?] SMSW operation get success on UMIP KVM guest
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>, LTP List <ltp@lists.linux.it>,
 Ping Fang <pifang@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMDEvMDcvMTkgMDk6NTAsIExpIFdhbmcgd3JvdGU6Cj4gSGVsbG8gdGhlcmUsCj4gCj4gTFRQ
L3VtaXBfYmFzaWNfdGVzdCBnZXQgZmFpbGVkIG9uIEtWTSBVTUlQCj4gc3lzdGVtKGtlcm5lbC12
NS4yLXJjNC54ODZfNjQpLiBUaGUgdGVzdCBpcyBvbmx5IHRyeWluZyB0byBkbwo+IMKgIMKgIMKg
YXNtIHZvbGF0aWxlKCJzbXN3ICUwXG4iIDogIj1tIiAodmFsKSk7Cj4gYW5kIGV4cGVjdCB0byBn
ZXQgU0lHU0VHViBpbiB0aGlzIFNNU1cgb3BlcmF0aW9uLCBidXQgaXQgZXhpdHMgd2l0aCAwCj4g
dW5leHBlY3RlZGx5LgoKSW4gYWRkaXRpb24gdG8gd2hhdCBUaG9tYXMgc2FpZCwgcGVyaGFwcyB5
b3UgYXJlIHVzaW5nIGEgaG9zdCB0aGF0IGRvZXMKKm5vdCogaGF2ZSBVTUlQLCBhbmQgY29uZmln
dXJpbmcgS1ZNIHRvIGVtdWxhdGUgaXQoKikuICBJbiB0aGF0IGNhc2UsIGl0CmlzIG5vdCBwb3Nz
aWJsZSB0byBpbnRlcmNlcHQgU01TVywgYW5kIHRoZXJlZm9yZSBpdCB3aWxsIGluY29ycmVjdGx5
CnN1Y2NlZWQuCgpQYW9sbwoKKCopIGJlZm9yZSB0aGUgeDg2IHBlb3BsZSBqdW1wIGF0IG1lLCB0
aGlzIHdvbid0IGhhcHBlbiB1bmxlc3MgeW91CmV4cGxpY2l0bHkgcGFzcyBhbiBvcHRpb24gdG8g
UUVNVSwgc3VjaCBhcyAiLWNwdSBob3N0LCt1bWlwIi4gOikgIFRoZQppbmNvcnJlY3QgZW11bGF0
aW9uIG9mIFNNU1cgd2hlbiBDUjQuVU1JUD0xIGlzIHdoeS4KCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
