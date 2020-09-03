Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A2725B86B
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 03:49:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D67723C6323
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 03:49:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8A8CE3C2DAF
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 03:49:24 +0200 (CEST)
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0632A600950
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 03:49:24 +0200 (CEST)
Received: by mail-yb1-xb44.google.com with SMTP id q3so988552ybp.7
 for <ltp@lists.linux.it>; Wed, 02 Sep 2020 18:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2bwJDrBGsMQD1Gh6AT6JAayA+sQzYI3rD2EvWtMlQ9o=;
 b=l9MnzljFCtjxNOzxcfXwE049bSFDwBsmKPOD8cRVKtgjVkI7b/IobFYMCx8Uu8FQfp
 6FmHrFRslKL5zufd3rbmyth5q0x+PxewadEVwFRbZY8ulyZ9zFTBaqvzkkWFVDf0DyX+
 HuoGMa7a13KRv34e8MGxn3fuVxcF4A7CxQM1raLMMqnHLMHffe7JJtdE9yApUli9I3f9
 MYwBhKf35oudEl7CdwCg0M5pFwrkd3T4/KAhVeQdmwCRwgZka/ZYWnAOZ/vKbqjhQ54K
 cbSahUu3yUPFgWfzN/4uvPKv8105s4Rj4stZg0ArPDv4I52c7Y0JMQnz5VExytNERMBR
 TaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2bwJDrBGsMQD1Gh6AT6JAayA+sQzYI3rD2EvWtMlQ9o=;
 b=bqY+vXzLD2rX46Sl12D97pbNsq7IAE1dncgeh4cGkWVOweePC371uuchxHwYTUCizs
 +7VD17oECPDe3YuPiylxW/CtkHYCJwBgZi8qfvZyUX1nUqN59Y2CJOAhGB+5I4AC42VW
 v7mz3E+TRZv1KkInCX36akKEA6D6hbRbAI/CcZ+/78Jv/Ghex5bV/1cYKpkBCAk6MmM4
 NpSTNlNIRf96Mdfzksng8yWhbHVic2KM51xNZ7t6cvuWo2S6v34WRin7+zhEOn2vT+9e
 tWnAGcY7icR++glMziLzhvs6P+HXs5eM2AMcw9bArj8LRxVPq2VKl2rjWx8IA7fIzMZ4
 TdXQ==
X-Gm-Message-State: AOAM530FlUUKPJ+T3qN85LeemLq8cqzRqViZVV1qvDNytRmaHgu7HFnK
 41tJTlUlFNHzBimQu7WEyHVW7kL+H/zNeA7QV1k=
X-Google-Smtp-Source: ABdhPJz5W7x5QjdzQE2wz03hh683h3Od64XQcAMtCV/oXLEMjfmFCuS2To3fxnumd+omAAQa8g5CPV6EKfx73+LmYYQ=
X-Received: by 2002:a25:b212:: with SMTP id i18mr879892ybj.148.1599097762818; 
 Wed, 02 Sep 2020 18:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
 <20200824074226.GB2466@yuki.lan>
 <CAF12kFvScxqxhY5wXTGL2RKnyM5vM0hEKDc+sHD-3Y=_C7FWcw@mail.gmail.com>
 <20200828130638.GD10501@yuki.lan>
 <CY4PR13MB11754F0072967B32B007D273FD520@CY4PR13MB1175.namprd13.prod.outlook.com>
In-Reply-To: <CY4PR13MB11754F0072967B32B007D273FD520@CY4PR13MB1175.namprd13.prod.outlook.com>
From: Cixi Geng <gengcixi@gmail.com>
Date: Thu, 3 Sep 2020 09:48:46 +0800
Message-ID: <CAF12kFspG2fQKUrA=HGWGQuHy=xJaL0gntqvksq+QmUK3mAdKw@mail.gmail.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC] ltp test add reboot function
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
Cc: Orson Zhai <orsonzhai@gmail.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>,
 xingfeng.kang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

PkFsc28gSSBkbyBjb25zaWRlciB0aGUgd2hvbGUgY29uY2VwdCBvZiBydW5uaW5nIHRoZSB0ZXN0
IGV4ZWN0dXRpb24KPmZyYW1ld29yayBvbiB0aGUgc2FtZSBtYWNoaW5lIGFzIHRoZSB0ZXN0Y2Fz
ZXMgYnJva2VuIGJ5IGRlc2luZyBmb3IKPmtlcm5lbCByZWxhdGVkIHRlc3RzLiBUaGUgd2F5IGZv
cndhcmQgaXMgdGhlIHBhdGNoc2V0IHNlbmQgYnkgUmljaGFyZAo+dGhhdCBpbXBsZW1lbnRzIHNp
bXBsZSB0ZXN0IGV4ZWN1dG9yIHRoYXQgcnVucyBvbiB0aGUgbWFjaGluZSB1bmRlciB0ZXN0Cj5h
bmQgY29tbXVuaWNhdGVzIHdpdGggYSBleGVjdXRpb24gZnJhbWV3b3JrIHRoYXQgcnVucyBvbiBh
IGNlbnRyYWwKPnNlcnZlci4KCkkgYWdyZWUgd2l0aCBzb21lIG9mIHlvdXIgdmlld3PvvIwgdGhl
IHRlc3QgYXJjaGl0ZWN0dXJlIHNlcnZlci9zbGF2ZSBpcyBtb3N0CmNvbW1vbiB0ZXN0IG1ldGhv
ZC4gYnV0IEkgYWxzbyB3YW50IHRvIGtub3cgd2hhdCBraW5kIG9mIGNvbm5lY3Rpb24KbWV0aG9k
IGJldHdlZW4gdGVzdCBtYWNoaW5lIGFuZCBjZW50cmFsIHNlcnZlciwgIHRoZSBzc2ggLCBhZGIg
b3Igc2VyaWFsPwoKYmVjYXVzZSBteSB0ZXN0IG1hY2hpbmUgaXMgYSBjZWxscGhvbmUsIG91ciBw
dXJwb3NlIGlzIHRlc3QgdGhlIGtlcm5lbCBiZWZvcmUKYW5kcm9pZE9TICwgc28gSSBidWlsZCBk
ZWJpYW5PUyBvbiBvdXIgaGFyYXdhcmUsIGFuZCB3ZSBjYW4gb25seSB1c2VkIHRoZQpzZXJpYWwg
cG9ydCBjb21tdW5pY2F0ZSB3aXRoIG91ciB0ZXN0bWFjaGluZS4KCkJpcmQsIFRpbSA8VGltLkJp
cmRAc29ueS5jb20+IOS6jjIwMjDlubQ45pyIMjjml6XlkajkupQg5LiL5Y2IMTE6MzflhpnpgZPv
vJoKPgo+Cj4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiAgQ3lyaWwg
SHJ1YmlzCj4gPgo+ID4gSGkhCj4gPiA+IFRoYW5rcyBmb3IgeW91IGV4cGVyaWVuY2VzIG9uIHRo
ZSByZWJvb3Q/Pz8KPiA+ID4gU28gZmFyIG15IG9waW5pb24gaXMgYWRkIGEgcmVib290IHNlcnZp
Y2UgYnkgY2hrY29uZmlnIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gPiA+IHRoZSBzZXJ2aWNl
IHdpbGwgc3RhcnQgcnVubHRwIHNjcmlwdHMgZnJvbSBsYXN0IGJyZWFrIG9mZiBwb2ludC4KPiA+
ID4gd2hlbiB0aGUgdHN0X3Rlc3QgaGF2ZSAudHN0X25lZWRzX3JlYm9vdCA9MSBmbGFnLCBpdCB3
aWwgc3Ryb3JlIHRoZQo+ID4gPiBydW4gc3RhdHVzIGFuZAo+ID4gPiByZWJvb3QgdGhlIG1hY2hp
bmUgYmVmb3JlIHJ1biB0aGUgdGVzdCBjYXNlLgo+ID4gPiBOb3cgSSB3YW50IHRvIGtub3cgd2hh
dCBuZWVkcyB0byBiZSBwcmVzZXJ2ZWQ/Pz8KPiA+Cj4gPiBUaGUgcnVubHRwIHNjcmlwdCBhbmQg
bHRwLXBhbiBjYW5ub3Qgc2F2ZSBhbmQgcmVzdG9yZSBhIHRlc3RydW4sCj4gPiBhbHRob3VnaCBz
b21ldGhpbmcgbGlrZSB0aGF0IG1heSBiZSBwb3NzaWJsZSB0byBpbXBsZW1lbnQsIEkgZG91YnQg
dGhhdAo+ID4gaXQgY291bGQgYmUgZWFzaWx5IGFkZGVkIHRvIHRoZSBjdXJyZW50IGluZnJhc3Ry
dWN0dXJlLiBOb3QgdG8gbWVudGlvbgo+ID4gdGhhdCBsdHAtcGFuIGhhcyBiZWVuIGluIGEgbWFp
bnRlbmFuY2UgbW9kZSAod2hpY2ggbWVhbnMgbm8gbmV3Cj4gPiBmZWF0dXJlcykgZm9yIHllYXJz
IG5vdy4KPiA+Cj4gPiBBbHNvIEkgZG8gY29uc2lkZXIgdGhlIHdob2xlIGNvbmNlcHQgb2YgcnVu
bmluZyB0aGUgdGVzdCBleGVjdHV0aW9uCj4gPiBmcmFtZXdvcmsgb24gdGhlIHNhbWUgbWFjaGlu
ZSBhcyB0aGUgdGVzdGNhc2VzIGJyb2tlbiBieSBkZXNpbmcgZm9yCj4gPiBrZXJuZWwgcmVsYXRl
ZCB0ZXN0cy4gVGhlIHdheSBmb3J3YXJkIGlzIHRoZSBwYXRjaHNldCBzZW5kIGJ5IFJpY2hhcmQK
PiA+IHRoYXQgaW1wbGVtZW50cyBzaW1wbGUgdGVzdCBleGVjdXRvciB0aGF0IHJ1bnMgb24gdGhl
IG1hY2hpbmUgdW5kZXIgdGVzdAo+ID4gYW5kIGNvbW11bmljYXRlcyB3aXRoIGEgZXhlY3V0aW9u
IGZyYW1ld29yayB0aGF0IHJ1bnMgb24gYSBjZW50cmFsCj4gPiBzZXJ2ZXIuCj4KPiBJIGRvbid0
IGhhdmUgYW55dGhpbmcgdG8gY29udHJpYnV0ZSB0byB0aGUgcHJpbWFyeSBkaXNjdXNzaW9uIHRv
cGljLAo+IGJ1dCBJIGp1c3QgaGF2ZSB0byBjaGltZSBpbiBoZXJlIHRoYXQgaXQncyB2ZXJ5IG5p
Y2UgdG8gaGVhciBzb21lb25lCj4gZWxzZSBleHByZXNzIHRoaXMgaWRlYS4gIEZ1ZWdvJ3MgYXJj
aGl0ZWN0dXJlIGlzIGJ1aWx0IG9uIGhhdmluZyB0aGUgdGVzdAo+IGV4ZWN1dGlvbiBkcml2ZW4g
ZnJvbSBhIG1hY2hpbmUgZXh0ZXJuYWwgdG8gdGhlIG1hY2hpbmUgdW5kZXIgdGVzdC4KPiBUbyBt
ZSwgaGF2aW5nIHRoZSBtYWNoaW5lIHVuZGVyIHRlc3QgZHJpdmUgaXRzIG93biB0ZXN0IGV4ZWN1
dGlvbiBzZWVtcyB3ZWlyZCwKPiBpbiB0aGF0IGl0IHJlcXVpcmVzIHRoZSBtYWNoaW5lIHRvIHBv
dGVudGlhbGx5IHBlcmZvcm0gYWN0aW9ucyAobGlrZSByZWJvb3QsCj4gb3Igc2F2aW5nIHBhbmlj
IGRhdGEpLCB0aGF0IHJlcXVpcmUgb3BlcmF0aW9uYWwgZml0bmVzcyAtIHdoaWNoIGlzIHRoZSB2
ZXJ5IHRoaW5nCj4gYmVpbmcgdGVzdGVkLgo+Cj4gU29ycnkgLSBqdXN0IGhhZCB0byB2ZW50IGEg
bGl0dGxlLiAgSSAicHJlYWNoIiB0aGlzIGEgbG90LCBhbmQgaXQncyBuaWNlIHRvIHRoZSBzYW1l
Cj4gb3BpbmlvbiBmcm9tIHNvbWVvbmUgZWxzZS4KPiAgLS0gVGltCj4KCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
