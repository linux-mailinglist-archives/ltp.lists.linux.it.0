Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 120AA15365
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 20:06:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DAD9F3EAEB4
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 20:06:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 969CB3EA04A
 for <ltp@lists.linux.it>; Mon,  6 May 2019 20:06:30 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 14B9E1001BE4
 for <ltp@lists.linux.it>; Mon,  6 May 2019 20:06:27 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id t22so6828833pgi.10
 for <ltp@lists.linux.it>; Mon, 06 May 2019 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=umPzyCxK3nZB90LL5Vvy/Z9dO+Y5YwNxMio/YGF4sXk=;
 b=nU/n9zb3f3yWDOIdec78QhgH0vQcu/iamIqrZ6N/VVpBd3Ndtk1hC/+TCFQV0lgYWm
 cv89evk5WcntJOl98v+ThjE0kIuv5qJ6CmcZgUdE9MuzSuV8sVh0EBQlHH1eLrpTgBkT
 0+vW1s9iNJKYBqegPLHxKMA+GEcoH2xWKJirNjmHyFApF/bVeuzfNAnteVcwDAaGo/oO
 CSfSwtambhVDth/2A7+IFoEIsVwhPOZQ3Sb2+vE6qMkRXKvNPk4R4A/ea+BgafhWzpY4
 ColmKiG6eE/b2OZO093PPg3KtT2LqJ3VFo+cS9Bwo0dJMVNgyHMcU/mHNrPu099hyHW+
 Mvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=umPzyCxK3nZB90LL5Vvy/Z9dO+Y5YwNxMio/YGF4sXk=;
 b=Z88TA32tgyzMVxs9ItB0KxCGkxK6zDbIKLpr1riLG9s59RtskwzCjFbrsevBXQuCJN
 Xz69V8o+p5BS4qxe848T/ZkNjPXfImXtqmSv8Mhs8PuKGF6vD3NiB056Yylr/gJ4ZHsF
 FGiCQ/wLsZCdhX+0PTHPa6+Ky+cgMJLQHa6p1V5NeVuyjfEfcIRcndZlLdHZuShxWk5O
 762ftkZP1wq1dMAdf7cLp7s4uADAGldlSJ2RHZcFSRz96FJWQANFpQ49lHUzIO1mUhks
 WEOMrk8IT+or44tXumcrtHJEBAqnFx+OgaHE7585rzNkP7EAdkzLYTyBbMFTNtjfmQyc
 FwMQ==
X-Gm-Message-State: APjAAAV9QC0Mi5XPSnbWr9gimmjbmBbsIpYWQB16hgVBwEMUaIu5o+px
 jXbnX1jFDQmIFVMf+lqblZUSwA==
X-Google-Smtp-Source: APXvYqxWHwPQ227Ia7HrYTOf0z9leDfuSGn05SqfAQW5YigQeGPvfuiCqp2yWrrrkk8+c9XdR84O0A==
X-Received: by 2002:a63:1b04:: with SMTP id b4mr33543070pgb.305.1557165987868; 
 Mon, 06 May 2019 11:06:27 -0700 (PDT)
Received: from smuckle.san.corp.google.com
 ([2620:15c:2d:3:8fbe:ee3b:c81d:238d])
 by smtp.gmail.com with ESMTPSA id j1sm12041911pgp.91.2019.05.06.11.06.26
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 11:06:27 -0700 (PDT)
To: Paul Lawrence <paullawrence@google.com>, ltp@lists.linux.it,
 kernel-team@android.com
References: <20190506153836.232148-1-paullawrence@google.com>
From: Steve Muckle <smuckle@google.com>
Message-ID: <e9e6ad70-3f35-1c07-d7e7-db2d1fe0477e@google.com>
Date: Mon, 6 May 2019 11:06:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506153836.232148-1-paullawrence@google.com>
Content-Language: en-GB
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_PASS,USER_IN_DEF_DKIM_WL,
 USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ANDROID: Fix ioctl03 test for Android
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

UmV2aWV3ZWQtYnk6IFN0ZXZlIE11Y2tsZSA8c211Y2tsZUBnb29nbGUuY29tPgoKT24gNS82LzE5
IDg6MzggQU0sICdQYXVsIExhd3JlbmNlJyB2aWEga2VybmVsLXRlYW0gd3JvdGU6Cj4gQW5kcm9p
ZCBoYXMgdHVuIGZpbGUgYXQgL2Rldi90dW4gbm90IC9kZXYvbmV0L3R1bgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFBhdWwgTGF3cmVuY2UgPHBhdWxsYXdyZW5jZUBnb29nbGUuY29tPgo+IC0tLQo+ICAg
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bDAzLmMgfCA1ICsrKysrCj4gICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGwwMy5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9pb2N0bC9pb2N0bDAzLmMKPiBpbmRleCBiMWI1MGVkYjQuLmNjOWEyZWRhZiAxMDA2NDQK
PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsMDMuYwo+ICsrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGwwMy5jCj4gQEAgLTc5LDYgKzc5
LDExIEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9mZWF0dXJlcyh2b2lkKQo+ICAgCXVuc2lnbmVkIGlu
dCBmZWF0dXJlcywgaTsKPiAgIAo+ICAgCWludCBuZXRmZCA9IG9wZW4oIi9kZXYvbmV0L3R1biIs
IE9fUkRXUik7Cj4gKwo+ICsJLyogQW5kcm9pZCBoYXMgdHVuIGF0IC9kZXYvdHVuICovCj4gKwlp
ZiAobmV0ZmQgPT0gLTEgJiYgKGVycm5vID09IEVOT0RFViB8fCBlcnJubyA9PSBFTk9FTlQpKQo+
ICsJCW5ldGZkID0gb3BlbigiL2Rldi90dW4iLCBPX1JEV1IpOwo+ICsKPiAgIAlpZiAobmV0ZmQg
PT0gLTEpIHsKPiAgIAkJaWYgKGVycm5vID09IEVOT0RFViB8fCBlcnJubyA9PSBFTk9FTlQpCj4g
ICAJCQl0c3RfYnJrKFRDT05GLCAiVFVOIHN1cHBvcnQgaXMgbWlzc2luZz8iKTsKPiAKCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
