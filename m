Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4285A36AFE6
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 10:44:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F39843C66D1
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 10:44:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF6813C1DA6
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 10:44:37 +0200 (CEST)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 712C21400DB5
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 10:44:36 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id s20so12714655plr.13
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 01:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=BwRkqJnC9Iks7H4HZHSdf7KYW3LIisOhjaSyI9oS3o8=;
 b=o4ynqSnBv8Rt7jxFg0BCkdq/ucR4qznfQpx0zPlZiXHzM1I1oDxw72FhRSTXpIt5gO
 8/2qk24D4bAbE7rPzjwxbsdPnmtpYGJliEyI86V5BzcC+3Y4gP/sBMB02xiom8EEkJAm
 4zcPLXKeQl6LrnToaAYZtShJpl7H1MMoViuajNtNCqQ55vLi44uO/+PeRVmVWBPMVTx1
 gSL+tNNGX/Hi8VwZBh/IYnC9mVZ2gBggxOkslv0PW+xNSikqVzMXk6T3wJteLCqfu+yg
 o/jnG0e3WjwDGeK+EWTpKSMxwNnWoh8TWNwv7wKkgnc95nKoYiZ9ODQEG6QYsjnJS/GS
 s28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=BwRkqJnC9Iks7H4HZHSdf7KYW3LIisOhjaSyI9oS3o8=;
 b=pGMsfE0PHY9feUEukVabkkp20VzzOU1vH/Z0uKeUJeSYX5MEFyXAUYdyyzKFoCb6n6
 XaYEg86FlUA/lGyBRS3z2JJ4prGiIzIKVbnqx0onmZyJyHW9T5x/0zOKkspye/nU4PzO
 9d4wXljRB0TuRDG8gzNyWihRlZcpOfxAFho05G0rkbSmInCKLGpkQ1+tV66Fo0RwM1gY
 B+u+qvZINbPq8alKWmj491v2HJswuOxQsvT5FiSCRlURiMxsPlpSmvQZ7yUMlTmvr/Aw
 1LiMoZ6/Toj1E054hJg3Q8+MHXwl9xR4Mn2JE3yJOXo28nWV4acHPp3KvZx5Xm7Ml+wA
 hDRw==
X-Gm-Message-State: AOAM530X5RKtinV+W+Ee4k8Vhf6dbERza+iqiS235dzFsDhJf2mYoLZD
 d9FeO1WKuIPCdKZw0v9WwGXB5w==
X-Google-Smtp-Source: ABdhPJxDCjAkP+LJ7DPgMe3wCbfDh3lCsn5oVBDlLGRrX5TdNnup6lXe5wUmgHaZe4574FRqZxgNQw==
X-Received: by 2002:a17:90a:2e03:: with SMTP id
 q3mr16338440pjd.206.1619426674948; 
 Mon, 26 Apr 2021 01:44:34 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id g185sm10414798pfb.120.2021.04.26.01.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 01:44:34 -0700 (PDT)
Date: Mon, 26 Apr 2021 14:14:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <20210426084432.byxkxbuig2ofj4ed@vireshk-i7>
References: <20210422072609.9938-1-sujiaxun@uniontech.com>
 <YIZSzNd9uK8kItYb@pevik>
 <20210426055556.dmcogdykez2ddxn3@vireshk-i7>
 <YIZa4Ph81LmkEkLZ@pevik>
 <20210426062357.i72js3urkoofvzcj@vireshk-i7>
 <f06db611-5024-78d6-07e9-36115889b7a7@uniontech.com>
 <20210426070320.iow3avu2pq22qled@vireshk-i7>
 <827cdde8-18df-75b0-743c-7876704c2039@uniontech.com>
 <20210426081219.tvaoqd67vj26bfr3@vireshk-i7>
 <8aaa1c0e-e481-3c3e-c281-53aaf1bd499e@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8aaa1c0e-e481-3c3e-c281-53aaf1bd499e@uniontech.com>
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

T24gMjYtMDQtMjEsIDE2OjI4LCBzdWppYXh1biB3cm90ZToKPiAKPiAKPiDlnKggMjAyMS80LzI2
IOS4i+WNiDQ6MTIsIFZpcmVzaCBLdW1hciDlhpnpgZM6Cj4gPiBPbiAyNi0wNC0yMSwgMTU6NTMs
IHN1amlheHVuIHdyb3RlOgo+ID4gPiAKPiA+ID4gCj4gPiA+IE9uIDIwMjEvNC8yNiDkuIvljYgz
OjAzLCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gPiA+ID4gT24gMjYtMDQtMjEsIDE1OjAwLCBzdWpp
YXh1biB3cm90ZToKPiA+ID4gPiA+IHVvc0B1b3MtUEM6fiQgZWNobyB8Z2NjIC1kTSAtRSAtIHwg
Z3JlcCAtaSBhcmNoCj4gPiA+ID4gPiAjZGVmaW5lIF9NSVBTX0FSQ0ggIm1pcHM2NHIyIgo+ID4g
PiA+ID4gI2RlZmluZSBfTUlQU19BUkNIX01JUFM2NFIyIDEKPiA+ID4gPiA+IHVvc0B1b3MtUEM6
fiQgZWNobyB8Z2NjIC1kTSAtRSAtIHwgZ3JlcCAtaSBtaXBzNjQKPiA+ID4gPiA+ICNkZWZpbmUg
X01JUFNfSVNBIF9NSVBTX0lTQV9NSVBTNjQKPiA+ID4gPiA+ICNkZWZpbmUgX01JUFNfVFVORSAi
bWlwczY0cjIiCj4gPiA+ID4gPiAjZGVmaW5lIF9NSVBTX1RVTkVfTUlQUzY0UjIgMQo+ID4gPiA+
ID4gI2RlZmluZSBfTUlQU19BUkNIICJtaXBzNjRyMiIKPiA+ID4gPiA+ICNkZWZpbmUgX01JUFNf
QVJDSF9NSVBTNjRSMiAxCj4gPiA+ID4gPiAjZGVmaW5lIF9fbWlwczY0IDEKPiA+ID4gPiA+IHVv
c0B1b3MtUEM6fiQgdW5hbWUgIC1tCj4gPiA+ID4gPiBtaXBzNjQKPiA+ID4gPiA+IAo+ID4gPiA+
ID4gVGhlIG1pcHMgYXJjaGl0ZWN0dXJlIGdjYyBoYXMgbm8gYnVpbHQtaW4gX19hcmNoNjRfXywg
b25seSBfX21pcHM2NAo+ID4gPiA+ID4gZGVmaW5pdGlvbnMuIE9mIGNvdXJzZSwgIl9fQklUU19Q
RVJfTE9ORyA9PSA2NCIgY2FuIGFsc28gYmUgdXNlZCwgYnV0IEkKPiA+ID4gPiA+IHRoaW5rIGl0
IGlzIGJldHRlciB0byB1c2UgX19taXBzNjQgaW4gdGhlIG1pcHMgYXJjaGl0ZWN0dXJlLgo+ID4g
PiA+IAo+ID4gPiA+IEhtbSwgSSB3aWxsIHJhdGhlciB0cnkgdG8gZG8gd2hhdCB0aGUga2VybmVs
IHNvdXJjZSBjb2RlIGRvZXMsIGkuZS4KPiA+ID4gPiB1c2UgX19CSVRTX1BFUl9MT05HIGhlcmUg
aW5zdGVhZC4KPiA+ID4gPiAKPiA+ID4gSSByZXN1Ym1pdHRlZCBhIHBhdGNoIGFuZCBjaGFuZ2Vk
ICJfX2FyY2g2NF9fIiB0byAiI2lmIF9fQklUU19QRVJfTE9ORyA9PQo+ID4gPiA2NCIsIHRoZSBs
aW5rIGlzOiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbHRwL3BhdGNoLzIw
MjEwNDI2MDc0ODEyLjI3Nzk4LTEtc3VqaWF4dW5AdW5pb250ZWNoLmNvbQo+ID4gCj4gPiBZb3Ug
c2hvdWxkIGhhdmUgY2MnZCBtZSBkaXJlY3RseSA6KAo+ID4gCj4gPiBJIGRvbid0IGhhdmUgdGhh
dCBwYXRjaCBpbiBteSBpbmJveC4uCj4gPiAKPiA+IFRob3VnaCB0aGUgcGF0Y2ggbG9va3MgZmlu
ZS4KPiA+IAo+IFNvcnJ5LCB3aGF0IHNob3VsZCBJIGRvIG5vdz8KCkp1c3QgcmVwbHkgdG8gdGhl
IGVtYWlsICh3aXRob3V0IGRlbGV0aW5nIGFueSBzdHVmZiksIGFuZCBhZGQgbWUgaW4gY2MKYW5k
IG1lbnRpb24gaW4gdGhlIHRvcCBvZiB0aGUgZW1haWwgbGlrZS4KCitWaXJlc2guCgotLSAKdmly
ZXNoCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
