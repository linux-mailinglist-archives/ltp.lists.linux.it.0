Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FE09261D9
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2024 15:29:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACCCC3D3DC9
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2024 15:29:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3DDBD3D08BB
 for <ltp@lists.linux.it>; Wed,  3 Jul 2024 15:29:46 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwan@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 494AE1BB8748
 for <ltp@lists.linux.it>; Wed,  3 Jul 2024 15:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720013383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Zrt5NIxvMubGuuk3AoNYbwhVpxscjNABqSUAANWMOs=;
 b=E+8pNy7iR1ktJ07F45Lo0funkjPoHMAeqEY51FWk8K2+7Nf7q36bzZ1odHa0/9TbJUMoE6
 Co80+RbhYnvkYglsOgxn92x9J4uM2gRn5P/3Tbs2T5keqKVNQeAtSXvshC0vXBTGKZS2R7
 kDM6pKU3QUkcxz0dfe1AVS0LTqooiI0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-bhfseEb5MNi3ei-JNmhtVA-1; Wed, 03 Jul 2024 09:29:40 -0400
X-MC-Unique: bhfseEb5MNi3ei-JNmhtVA-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2c95c80c6f7so1356575a91.1
 for <ltp@lists.linux.it>; Wed, 03 Jul 2024 06:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720013378; x=1720618178;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Zrt5NIxvMubGuuk3AoNYbwhVpxscjNABqSUAANWMOs=;
 b=MDVhq2mZCDeVOnOMXC9V5gglhTtmC0Vz6gFfdRqrHNuk1E1o3EwHTVCVqcUzyNnUk3
 lhslKGKbdYVXrR4LGZUL+NLcHzOvYAFn1hob1WmEkbJUGMAGKWD8mXGs1yzv2xKShOdW
 HBB7uTVJoHfdWhy3dbYzaEqC7C7AwnvF6A2aYFaHuntGpNfh46Wrlguh+fMxUawGS2UP
 AM+5f3h6auZij4i7SUcBDeSgkJ6ygB5P3JDqUDWNGfTuMdMQ4xmxnZz1t+2pMTwflwv2
 zZFcSy1HATFln5VmsxARMqmoSHI+TU/ju3FneEzfbtEvjTAIbDy+mrUhlf3UsH1tNhXO
 yfNA==
X-Gm-Message-State: AOJu0Yx8K4XJ1AQUio3lHovhJlMm044SwR/zW8IeI6OGnZwMPTqEUxdJ
 RdRXy1tNTEbid8bLA29zDGW2FW+lRjTkIlrJAX1JjsgrdFt1cElSXz9Cj6mmQm9yinoI22PepGf
 gGjGoaGA54vANqZOFr6D7C41lIVbYBklS1cArUX1emSZrlXCerPat02fg+4Dn40ekqITCLKl0zE
 zUfK4xanSclEwrPjKEEu58jBUv76ZqI7dQztS/
X-Received: by 2002:a17:90b:3c12:b0:2c9:81a2:e8da with SMTP id
 98e67ed59e1d1-2c981a2ea16mr719047a91.35.1720013377891; 
 Wed, 03 Jul 2024 06:29:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUJMIX+cfd94UtqL73wvkySufaJNiOyLyZEZjhmDCGH0YXeWPiXQRIqUckHft4+fr1vvgPgqFSvkNexmxLywM=
X-Received: by 2002:a17:90b:3c12:b0:2c9:81a2:e8da with SMTP id
 98e67ed59e1d1-2c981a2ea16mr719030a91.35.1720013377441; Wed, 03 Jul 2024
 06:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240701-landlock-v1-0-58e9af649a72@suse.com>
 <20240701-landlock-v1-10-58e9af649a72@suse.com>
In-Reply-To: <20240701-landlock-v1-10-58e9af649a72@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 3 Jul 2024 21:29:25 +0800
Message-ID: <CAEemH2dFWnFhXMN09G1osmrGw4NXQ58ozhErDWjVqB7FAGx-0g@mail.gmail.com>
To: Andrea Cervesato <andrea.cervesato@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH 10/10] Add landlock06 test
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

TmljZSB3b3JrIG9uIHRob3NlIGxhbmRsb2NrIHN5c2NhbGxzIHRlc3QuCgpSZXZpZXdlZC1ieTog
TGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+CgpPbiBNb24sIEp1bCAxLCAyMDI0IGF0IDExOjQ1
4oCvUE0gQW5kcmVhIENlcnZlc2F0byA8YW5kcmVhLmNlcnZlc2F0b0BzdXNlLmRlPgp3cm90ZToK
Cj4gRnJvbTogQW5kcmVhIENlcnZlc2F0byA8YW5kcmVhLmNlcnZlc2F0b0BzdXNlLmNvbT4KPgo+
IFRoaXMgdGVzdCB2ZXJpZmllcyBMQU5ETE9DS19BQ0NFU1NfRlNfSU9DVExfREVWIGFjY2VzcyBp
biB0aGUKPiBsYW5kbG9jayBzYW5kYm94IGJ5IGNyZWF0aW5nIGEgcGlwZSBhbmQgdGVzdGluZyB0
aGF0IGlvY3RsKCkgY2FuCj4gYmUgZXhlY3V0ZWQgb24gaXQuIFRoZSB0ZXN0IGlzIGFsc28gdmVy
aWZ5aW5nIHRoYXQgc29tZSBvZiB0aGUgSS9PCj4gb3BlcmF0aW9ucyBjYW4gYmUgYWx3YXlzIGV4
ZWN1dGVkIG5vIG1hdHRlciB0aGUgc2FuZGJveCBydWxlcy4KPiBUaGlzIGZlYXR1cmUgaXMgYXZh
aWxhYmxlIHNpbmNlIGtlcm5lbCA2LjEwLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhIENlcnZl
c2F0byA8YW5kcmVhLmNlcnZlc2F0b0BzdXNlLmNvbT4KPiAtLS0KPiAgcnVudGVzdC9zeXNjYWxs
cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICB0ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2xhbmRsb2NrLy5naXRpZ25vcmUgICB8ICAgMSArCj4gIHRlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvbGFuZGxvY2svbGFuZGxvY2swNi5jIHwgMTEwCj4gKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTEyIGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9ydW50ZXN0L3N5c2NhbGxzIGIvcnVudGVzdC9zeXNjYWxscwo+IGluZGV4IGEz
YWRlNmRjMS4uZWJhZjhkZWE0IDEwMDY0NAo+IC0tLSBhL3J1bnRlc3Qvc3lzY2FsbHMKPiArKysg
Yi9ydW50ZXN0L3N5c2NhbGxzCj4gQEAgLTY4OSw2ICs2ODksNyBAQCBsYW5kbG9jazAyIGxhbmRs
b2NrMDIKPiAgbGFuZGxvY2swMyBsYW5kbG9jazAzCj4gIGxhbmRsb2NrMDQgbGFuZGxvY2swNAo+
ICBsYW5kbG9jazA1IGxhbmRsb2NrMDUKPiArbGFuZGxvY2swNiBsYW5kbG9jazA2Cj4KPiAgbGNo
b3duMDEgbGNob3duMDEKPiAgbGNob3duMDFfMTYgbGNob3duMDFfMTYKPiBkaWZmIC0tZ2l0IGEv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9sYW5kbG9jay8uZ2l0aWdub3JlCj4gYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2xhbmRsb2NrLy5naXRpZ25vcmUKPiBpbmRleCBhN2VhNmJlMmUu
LjMxNWFjMWRjYSAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2xhbmRs
b2NrLy5naXRpZ25vcmUKPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2xhbmRsb2Nr
Ly5naXRpZ25vcmUKPiBAQCAtNCwzICs0LDQgQEAgbGFuZGxvY2swMgo+ICBsYW5kbG9jazAzCj4g
IGxhbmRsb2NrMDQKPiAgbGFuZGxvY2swNQo+ICtsYW5kbG9jazA2Cj4gZGlmZiAtLWdpdCBhL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbGFuZGxvY2svbGFuZGxvY2swNi5jCj4gYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2xhbmRsb2NrL2xhbmRsb2NrMDYuYwo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwLi4zMjgxYzJkMmQKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9sYW5kbG9jay9sYW5kbG9jazA2LmMKPiBAQCAt
MCwwICsxLDExMCBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1s
YXRlcgo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgU1VTRSBMTEMgQW5kcmVhIENlcnZl
c2F0byA8Cj4gYW5kcmVhLmNlcnZlc2F0b0BzdXNlLmNvbT4KPiArICovCj4gKwo+ICsvKlwKPiAr
ICogW0Rlc2NyaXB0aW9uXQo+ICsgKgo+ICsgKiBUaGlzIHRlc3QgdmVyaWZpZXMgTEFORExPQ0tf
QUNDRVNTX0ZTX0lPQ1RMX0RFViBhY2Nlc3MgaW4gdGhlCj4gKyAqIGxhbmRsb2NrIHNhbmRib3gg
YnkgY3JlYXRpbmcgYSBwaXBlIGFuZCB0ZXN0aW5nIHRoYXQgaW9jdGwoKSBjYW4gYmUKPiBleGVj
dXRlZAo+ICsgKiBvbiBpdC4gVGhlIHRlc3QgaXMgYWxzbyB2ZXJpZnlpbmcgdGhhdCBzb21lIG9m
IHRoZSBJL08gb3BlcmF0aW9ucyBjYW4KPiBiZQo+ICsgKiBhbHdheXMgZXhlY3V0ZWQgbm8gbWF0
dGVyIHRoZSBzYW5kYm94IHJ1bGVzLgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlICJsYW5kbG9ja19j
b21tb24uaCIKPiArI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgo+ICsKPiArI2RlZmluZSBNTlRQT0lO
VCAic2FuZGJveCIKPiArI2RlZmluZSBGSUxFTkFNRSBNTlRQT0lOVCIvZmlmbyIKPiArCj4gK3N0
YXRpYyBzdHJ1Y3QgbGFuZGxvY2tfcnVsZXNldF9hdHRyICpydWxlc2V0X2F0dHI7Cj4gK3N0YXRp
YyBzdHJ1Y3QgbGFuZGxvY2tfcGF0aF9iZW5lYXRoX2F0dHIgKnBhdGhfYmVuZWF0aF9hdHRyOwo+
ICtzdGF0aWMgaW50IGZpbGVfZmQ7Cj4gK3N0YXRpYyBpbnQgZGV2X2ZkOwo+ICsKPiArc3RhdGlj
IHZvaWQgcnVuKHZvaWQpCj4gK3sKPiArICAgICAgIGlmICghU0FGRV9GT1JLKCkpIHsKPiArICAg
ICAgICAgICAgICAgaW50IGZsYWc7Cj4gKyAgICAgICAgICAgICAgIHNpemVfdCBzeiA9IDA7Cj4g
Kwo+ICsgICAgICAgICAgICAgICBUU1RfRVhQX1BBU1MoaW9jdGwoZmlsZV9mZCwgRklPTlJFQUQs
ICZzeikpOwo+ICsKPiArICAgICAgICAgICAgICAgLyogY2hlY2sgdW5yZXN0cmljdGFibGUgY29t
bWFuZHMgKi8KPiArICAgICAgICAgICAgICAgVFNUX0VYUF9QQVNTKGlvY3RsKGRldl9mZCwgRklP
Q0xFWCkpOwo+ICsgICAgICAgICAgICAgICBUU1RfRVhQX1BBU1MoaW9jdGwoZGV2X2ZkLCBGSU9O
Q0xFWCkpOwo+ICsgICAgICAgICAgICAgICBUU1RfRVhQX1BBU1MoaW9jdGwoZGV2X2ZkLCBGSU9O
QklPLCAmZmxhZykpOwo+ICsgICAgICAgICAgICAgICBUU1RfRVhQX1BBU1MoaW9jdGwoZGV2X2Zk
LCBGSU9BU1lOQywgJmZsYWcpKTsKPiArCj4gKyAgICAgICAgICAgICAgIF9leGl0KDApOwo+ICsg
ICAgICAgfQo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQo+ICt7Cj4gKyAgICAg
ICBpbnQgcnVsZXNldF9mZDsKPiArCj4gKyAgICAgICB2ZXJpZnlfbGFuZGxvY2tfaXNfZW5hYmxl
ZCgpOwo+ICsKPiArICAgICAgIFNBRkVfTUtGSUZPKEZJTEVOQU1FLCAwNjQwKTsKPiArCj4gKyAg
ICAgICBmaWxlX2ZkID0gU0FGRV9PUEVOKEZJTEVOQU1FLCBPX1JET05MWSB8IE9fTk9OQkxPQ0ss
IDA2NDApOwo+ICsgICAgICAgZGV2X2ZkID0gU0FGRV9PUEVOKCIvZGV2L3plcm8iLCBPX1JET05M
WSB8IE9fTk9OQkxPQ0ssIDA2NDApOwo+ICsKPiArICAgICAgIHRzdF9yZXMoVElORk8sICJBcHBs
eWluZyBMQU5ETE9DS19BQ0NFU1NfRlNfSU9DVExfREVWIik7Cj4gKwo+ICsgICAgICAgcnVsZXNl
dF9hdHRyLT5oYW5kbGVkX2FjY2Vzc19mcyA9IExBTkRMT0NLX0FDQ0VTU19GU19JT0NUTF9ERVY7
Cj4gKwo+ICsgICAgICAgcnVsZXNldF9mZCA9IFNBRkVfTEFORExPQ0tfQ1JFQVRFX1JVTEVTRVQo
Cj4gKyAgICAgICAgICAgICAgIHJ1bGVzZXRfYXR0ciwgc2l6ZW9mKHN0cnVjdCBsYW5kbG9ja19y
dWxlc2V0X2F0dHIpLCAwKTsKPiArCj4gKyAgICAgICBhcHBseV9sYW5kbG9ja19sYXllcigKPiAr
ICAgICAgICAgICAgICAgcnVsZXNldF9hdHRyLAo+ICsgICAgICAgICAgICAgICBwYXRoX2JlbmVh
dGhfYXR0ciwKPiArICAgICAgICAgICAgICAgTU5UUE9JTlQsCj4gKyAgICAgICAgICAgICAgIExB
TkRMT0NLX0FDQ0VTU19GU19JT0NUTF9ERVYKPiArICAgICAgICk7Cj4gKwo+ICsgICAgICAgU0FG
RV9DTE9TRShydWxlc2V0X2ZkKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgY2xlYW51cCh2b2lk
KQo+ICt7Cj4gKyAgICAgICBpZiAoZGV2X2ZkICE9IC0xKQo+ICsgICAgICAgICAgICAgICBTQUZF
X0NMT1NFKGRldl9mZCk7Cj4gKwo+ICsgICAgICAgaWYgKGZpbGVfZmQgIT0gLTEpCj4gKyAgICAg
ICAgICAgICAgIFNBRkVfQ0xPU0UoZmlsZV9mZCk7Cj4gK30KPiArCj4gK3N0YXRpYyBzdHJ1Y3Qg
dHN0X3Rlc3QgdGVzdCA9IHsKPiArICAgICAgIC50ZXN0X2FsbCA9IHJ1biwKPiArICAgICAgIC5z
ZXR1cCA9IHNldHVwLAo+ICsgICAgICAgLmNsZWFudXAgPSBjbGVhbnVwLAo+ICsgICAgICAgLm1p
bl9rdmVyID0gIjYuMTAiLAo+ICsgICAgICAgLm5lZWRzX3RtcGRpciA9IDEsCj4gKyAgICAgICAu
bmVlZHNfcm9vdCA9IDEsCj4gKyAgICAgICAuZm9ya3NfY2hpbGQgPSAxLAo+ICsgICAgICAgLm5l
ZWRzX2tjb25maWdzID0gKGNvbnN0IGNoYXIgKltdKSB7Cj4gKyAgICAgICAgICAgICAgICJDT05G
SUdfU0VDVVJJVFlfTEFORExPQ0s9eSIsCj4gKyAgICAgICAgICAgICAgIE5VTEwKPiArICAgICAg
IH0sCj4gKyAgICAgICAuYnVmcyA9IChzdHJ1Y3QgdHN0X2J1ZmZlcnMgW10pIHsKPiArICAgICAg
ICAgICAgICAgeyZydWxlc2V0X2F0dHIsIC5zaXplID0gc2l6ZW9mKHN0cnVjdAo+IGxhbmRsb2Nr
X3J1bGVzZXRfYXR0cil9LAo+ICsgICAgICAgICAgICAgICB7JnBhdGhfYmVuZWF0aF9hdHRyLCAu
c2l6ZSA9IHNpemVvZihzdHJ1Y3QKPiBsYW5kbG9ja19wYXRoX2JlbmVhdGhfYXR0cil9LAo+ICsg
ICAgICAgICAgICAgICB7fSwKPiArICAgICAgIH0sCj4gKyAgICAgICAuY2FwcyA9IChzdHJ1Y3Qg
dHN0X2NhcCBbXSkgewo+ICsgICAgICAgICAgICAgICBUU1RfQ0FQKFRTVF9DQVBfUkVRLCBDQVBf
U1lTX0FETUlOKSwKPiArICAgICAgICAgICAgICAge30KPiArICAgICAgIH0sCj4gKyAgICAgICAu
Zm9ybWF0X2RldmljZSA9IDEsCj4gKyAgICAgICAubW91bnRfZGV2aWNlID0gMSwKPiArICAgICAg
IC5tbnRwb2ludCA9IE1OVFBPSU5ULAo+ICsgICAgICAgLmFsbF9maWxlc3lzdGVtcyA9IDEsCj4g
KyAgICAgICAuc2tpcF9maWxlc3lzdGVtcyA9IChjb25zdCBjaGFyICpbXSkgewo+ICsgICAgICAg
ICAgICAgICAidmZhdCIsCj4gKyAgICAgICAgICAgICAgIE5VTEwKPiArICAgICAgIH0sCj4gK307
Cj4KPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IE1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo+Cj4KCi0tIApSZWdhcmRzLApMaSBXYW5nCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
