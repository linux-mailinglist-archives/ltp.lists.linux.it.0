Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 794212EEFF1
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 10:45:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A821B3C6498
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 10:45:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EDF003C314B
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 10:45:49 +0100 (CET)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7AABB20006C
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 10:45:49 +0100 (CET)
Received: by mail-yb1-xb2b.google.com with SMTP id k78so8811200ybf.12
 for <ltp@lists.linux.it>; Fri, 08 Jan 2021 01:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mm4PYY3SJ9UyXzBEiWrAjV1BpZ40ZAiaoq95cvMLshI=;
 b=snQ5gA7Do5lpy+oVKAo+gQtGeMQ28m9XRBevsRp3INY4d+UInKDIg70bKvfWNcjBho
 swXtC2HNDFN/GCpuEiv8g1gqJYGS9kMIzIf6oWrk5ZJEjzwGbYX08LLn6CKje0nDn8YU
 AlYXHP6aB/yx5rjHnO1Skqmpw6snuSJNhsAHFgbiSE/XbesRG1GjiB2RBQnlsKtjf02A
 dRfsYJy/yh+AF6LaWvuJdk4SktV8nOBlaPzTlcgNzWs2EYt1X/8nYOYLMYDqdZzGPUHv
 ch3EDhfralDQjS1FrQoWcCwMLTL1LzAC+wl4cLQBxIMPNafK4GL5PbLldVhmGcHGe834
 GuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mm4PYY3SJ9UyXzBEiWrAjV1BpZ40ZAiaoq95cvMLshI=;
 b=eUuoioEpjKER/hlDJHIeeuu8d4/gzOtUJwBhbZI93keaNtUCspM79c95OgC2eMKixR
 PMjiSt9bZTmuSwDpGHibOZy5CpZ4esjFGSk0hKVtI8a7triDf2LpSI2+GTqUGPnDXtqc
 kGpflJZ+jNeafkTWcKGpQ1B21j0T/51+5Yw3KE6zCqFunYVERqmOhtUIvT+rDooIv0JD
 6mnPKlHX+XXeiq6J2C1G2JrcLx28Zfao9d1A3w1Ru7C0h7mtGhogDDKa6LyYsHtOEy6C
 drA68uCMQ14KwVMukHIDhv6laeFaH41B5QmmvYbxCt4spe5KaqlP4D9iNDxDumf4doXn
 jqFQ==
X-Gm-Message-State: AOAM532FlPdKz0SWyGmpoaWus+xfHIoO+Ix8HDr8QyUcOXsTcAuZMMoV
 aipjpDCsHIYDkmUM48ZXm/lZ2Gxq+Gp+JAhrSlk=
X-Google-Smtp-Source: ABdhPJxVdA0vvWOpUtXjcHNAoeN6Vyytc3Ko1ySUI2wJX/0eGdVNEv2VG82RUu8PFNwKQdlIl87pncI35zP7PxdYaTg=
X-Received: by 2002:a25:77d3:: with SMTP id s202mr4797201ybc.148.1610099148357; 
 Fri, 08 Jan 2021 01:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20201223033517.1464263-1-gengcixi@gmail.com>
 <20201223033517.1464263-3-gengcixi@gmail.com>
 <X/cTWFNvtJ5NCyOh@yuki.lan>
 <CAF12kFvhp0sVfrX9Rhe2XumZPVCA_em51UVr2QkiHOpECC4mDg@mail.gmail.com>
 <X/gnOarZhZhOy+mQ@yuki.lan>
In-Reply-To: <X/gnOarZhZhOy+mQ@yuki.lan>
From: Cixi Geng <gengcixi@gmail.com>
Date: Fri, 8 Jan 2021 17:45:12 +0800
Message-ID: <CAF12kFtRGVW3z4-xCAJruoHWOSRtVh0wq+1xiQ--hm2pQDj8Wg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] lib: implement rtctime_save and
 rtctime_restore function
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
Cc: Cixi Geng <cixi.geng1@unisoc.com>, LTP List <ltp@lists.linux.it>,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Q3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+IOS6jjIwMjHlubQx5pyIOOaXpeWRqOS6lCDk
uIvljYg1OjMz5YaZ6YGT77yaCj4KPiBIaSEKPiA+ID4gPiArdm9pZCB0c3RfcnRjdGltZV9yZXN0
b3JlKHZvaWQpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICBzdGF0aWMgc3RydWN0IHRpbWVzcGVj
IG1vbm9fZW5kLCBlbGFwc2VkOwo+ID4gPiA+ICsgICAgIHN0YXRpYyBzdHJ1Y3QgdGltZXNwZWMg
cnRjX2JlZ2luX3RtLCBydGNfYWRqdXN0Owo+ID4gPiA+ICsgICAgIHN0YXRpYyBzdHJ1Y3QgcnRj
X3RpbWUgcnRjX3Jlc3RvcmU7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIGlmICghY2xvY2tfc2F2
ZWQpCj4gPiA+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAg
IGNsb2NrX3NhdmVkID0gMDsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgaWYgKHRzdF9jbG9ja19n
ZXR0aW1lKENMT0NLX01PTk9UT05JQ19SQVcsICZtb25vX2VuZCkpCj4gPiA+ID4gKyAgICAgICAg
ICAgICB0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAidHN0X2Nsb2NrX2dldHRpbWUoKSBtb25vdG9u
aWMgZmFpbGVkIik7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIGVsYXBzZWQgPSB0c3RfdGltZXNw
ZWNfZGlmZihtb25vX2VuZCwgbW9ub19iZWdpbik7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHJ0
Y19iZWdpbl90bS50dl9zZWMgPSB0c3RfcnRjX3RtX3RvX3RpbWUoJnJ0Y19iZWdpbik7Cj4gPiA+
Cj4gPiA+IFdlIHNob3VsZCBjbGVhciB0aGUgdHZfbnNlYyBoZXJlIG90aGVyd2lzZSBpdCB3aWxs
IGNvbnRhaW4gZ2FyYmFnZS4KPiA+IFRoZSBydGNfYmVnaW5fdG0gaXMgZGVmaW5lZCBpbiB0aGlz
IGZ1bmN0aW9uPz8/IGFuZCB0dl9uc2VjIG5ldmVyIGFzc2lnbmVkPz8/Cj4gPiBzbyBJIHRoaW5r
IGl0IHdpbGwgbm90IHByb2R1Y2UgYW55IGdhcmJhZ2UuCj4KPiBJdCdzIG5ldmVyIGFzc2lnbmVk
IGFuZCBkZWNsYXJlZCBvbiBzdGFjaywgc28gaXQgd2lsbCBjb250YWluIGdhcmJhZ2UKPiB3aGlj
aCB3aWxsIGJlIGV2ZW50dWFsbHkgYWRkZWQgdG8gdGhlIHJ0Y19hZGp1c3QudHZfc2VjLiBUZWNo
bmljYWxseQo+IHRoZSB0dl9uc2VjIGlzIGxvbmcsIHNvIG9uIDY0IGJpdCBwbGF0Zm9ybSBpdCBt
YXkgYWRkIHVwIHRvIDEwXjEwCj4gc2Vjb25kcyB0byB0aGUgcmVzdWx0IGlmIHdlIGFyZSB1bmx1
Y2t5IGFuZCB1cHBlciBiaXRzIGFyZSBzZXQuIE9uIDMyCj4gYml0IHRoZXJlIGlzIG5vdCBtdWNo
IHJvb20gZm9yIGVycm9yIGJ0dywgdXAgdG8gMiBzZWNvbmRzIHNpbmNlIGxvbmcgaXMKPiBvbmx5
IDRieXRlcyB0aGVyZS4KPgoKb2ssSSBnb3QgaXQsIHRoYW5rcyBmb3IgeW91IGV4cGxhaW4sIEkg
d2lsbCBmaXhlZCB0aGlzIGlzc3VlCgo+ID4gPiA+ICsgICAgIHJ0Y19hZGp1c3QgPSB0c3RfdGlt
ZXNwZWNfYWRkKHJ0Y19iZWdpbl90bSwgZWxhcHNlZCk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAg
IHRzdF9ydGNfdGltZV90b190bShydGNfYWRqdXN0LnR2X3NlYywgJnJ0Y19yZXN0b3JlKTsKPiA+
ID4gPiArCj4gPiA+ID4gKyAgICAgLyogcmVzdG9yZSByZWFsdGltZSBjbG9jayBiYXNlZCBvbiBt
b25vdG9uaWMgZGVsdGEgKi8KPiA+ID4gPiArICAgICBpZiAodHN0X3J0Y19zZXR0aW1lKCZydGNf
cmVzdG9yZSkpCj4gPiA+ID4gKyAgICAgICAgICAgICB0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAi
dHN0X3J0Y19zZXR0aW1lKCkgcmVhbHRpbWUgZmFpbGVkIik7Cj4gPiA+ID4gK30KPiA+ID4KPiA+
ID4gT3RoZXIgdGhhbiB0aGlzLCBpdCBsb29rcyBnb29kLgo+ID4gPgo+ID4gPiAtLQo+ID4gPiBD
eXJpbCBIcnViaXMKPiA+ID4gY2hydWJpc0BzdXNlLmN6Cj4KPiAtLQo+IEN5cmlsIEhydWJpcwo+
IGNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
