Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 938ED2EEF54
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 10:20:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28D733C648E
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 10:20:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 09A2F3C291E
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 10:20:15 +0100 (CET)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B1A096000BF
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 10:20:15 +0100 (CET)
Received: by mail-yb1-xb35.google.com with SMTP id v67so8843440ybi.1
 for <ltp@lists.linux.it>; Fri, 08 Jan 2021 01:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uHTZH+Hw1bCDyI+47SVjWWG7WEF4jIu6USDTzS/0iRo=;
 b=P8q7/bRa0WP6elHWG81nlDZEAh7F+YgippcA9DoT8sFV+71sR6PJO3uzpoxtC6ZBqR
 6DtiJ8W/JOsDPCRVfBwJ/Mi8zOpMapbroN9p+HlC3ST1S8ed1Q7fmai/38lbe1bibe46
 a3Xm69jf53xvYPIIWnJjdKD/KYY7FjYre0VEhCFeWIH8gfxlvL3WMZ4YR1e2FeGmTA76
 fMAzuqXhjrMnPltG64q7+LWAaNXIjoCDArBzP/l/DBOHUi1Wk2zbvfBkk+bLveDTzAj8
 nP7gPzzQHZTRB1SFhqJTAfZqmfeEHjSAaFssufGplH5HQVtxVzGNmBykHFY3xtzp8B31
 LpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uHTZH+Hw1bCDyI+47SVjWWG7WEF4jIu6USDTzS/0iRo=;
 b=Pq3jdFCPqK/Ns4eSYKQNHsbfwuvGaW8L//c8kGVBZac1QR9usNzQ+3YwWxGU+UOzMM
 DCxofPOxS3aNFT42t6HRqdQXKSLvCNiwTHOYonzUJ3I08iVJ6kGFVricvvV3YhtCr8XU
 lwN29D03UsWdTbN9wAXv2i4TBq5WKi/469MBeHcOD1Qn8NBOweVkNEgRn9LFyg1Nns5p
 5vszlSad2SYkXWFK//1DzjdsDglTcGjHmxCEzvOXapLI9T/KzZWHF7tTnqh9rNQKuOOJ
 cpOHvE/S9noc09EFpayesgGRc/0p6TYcoO3Nxkk9sjPC3fkfLfNSK21jbghXwf+BEj+A
 Myrw==
X-Gm-Message-State: AOAM531GGfd3PeoJ/P3JjGUC6CRrmWjFtjdRmvzftc1YiRvdxmKjm2Of
 1y/+nakiGWXCVqTtCWtQ3BwjQyxlYZiZGXe1Pvo=
X-Google-Smtp-Source: ABdhPJzy5Z5KTKGDYSEOR425H1FhLca9BndqXWV6Yb1SsL44Hey91t8HkbEwutUQvkzC+i4O+hSI5ho3Tc6ICyrXWOw=
X-Received: by 2002:a25:2301:: with SMTP id j1mr4507944ybj.151.1610097614579; 
 Fri, 08 Jan 2021 01:20:14 -0800 (PST)
MIME-Version: 1.0
References: <20201223033517.1464263-1-gengcixi@gmail.com>
 <20201223033517.1464263-3-gengcixi@gmail.com>
 <X/cTWFNvtJ5NCyOh@yuki.lan>
In-Reply-To: <X/cTWFNvtJ5NCyOh@yuki.lan>
From: Cixi Geng <gengcixi@gmail.com>
Date: Fri, 8 Jan 2021 17:19:38 +0800
Message-ID: <CAF12kFvhp0sVfrX9Rhe2XumZPVCA_em51UVr2QkiHOpECC4mDg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

Q3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+IOS6jjIwMjHlubQx5pyIN+aXpeWRqOWbmyDk
uIvljYg5OjU25YaZ6YGT77yaCj4KPiA+ICBzdGF0aWMgc3RydWN0IHRpbWVzcGVjIHJlYWxfYmVn
aW4sIG1vbm9fYmVnaW47Cj4gPgo+ID4gK3N0YXRpYyBzdHJ1Y3QgcnRjX3RpbWUgcnRjX2JlZ2lu
Owo+ID4gKwo+ID4gIHN0YXRpYyBpbnQgY2xvY2tfc2F2ZWQ7Cj4gPgo+ID4gIHZvaWQgdHN0X3dh
bGxjbG9ja19zYXZlKHZvaWQpCj4gPiBAQCAtNTgsMyArNjEsNDIgQEAgdm9pZCB0c3Rfd2FsbGNs
b2NrX3Jlc3RvcmUodm9pZCkKPiA+ICAgICAgIGlmICh0c3RfY2xvY2tfc2V0dGltZShDTE9DS19S
RUFMVElNRSwgJmFkanVzdCkpCj4gPiAgICAgICAgICAgICAgIHRzdF9icmsoVEJST0sgfCBURVJS
Tk8sICJ0c3RfY2xvY2tfc2V0dGltZSgpIHJlYWx0aW1lIGZhaWxlZCIpOwo+ID4gIH0KPiA+ICsK
PiA+ICt2b2lkIHRzdF9ydGN0aW1lX3NhdmUodm9pZCkKPiA+ICt7Cj4gPiArICAgICAvKiBzYXZl
IGluaXRpYWwgbW9ub3RvbmljIHRpbWUgdG8gcmVzdG9yZSBpdCB3aGVuIG5lZWRlZCAqLwo+ID4g
KyAgICAgaWYgKHRzdF9ydGNfZ2V0dGltZSgmcnRjX2JlZ2luKSkKPiA+ICsgICAgICAgICAgICAg
dHN0X2JyayhUQlJPSyB8IFRFUlJOTywgInRzdF9ydGNfZ2V0dGltZSgpIHJlYWx0aW1lIGZhaWxl
ZCIpOwo+ID4gKwo+ID4gKyAgICAgaWYgKHRzdF9jbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05J
Q19SQVcsICZtb25vX2JlZ2luKSkKPiA+ICsgICAgICAgICAgICAgdHN0X2JyayhUQlJPSyB8IFRF
UlJOTywgInRzdF9jbG9ja19nZXR0aW1lKCkgbW9ub3RvbmljIGZhaWxlZCIpOwo+ID4gKwo+ID4g
KyAgICAgY2xvY2tfc2F2ZWQgPSAxOwo+Cj4gSXQgd291bGQgYmUgYmV0dGVyIGlmIHdlIGRlZmlu
ZWQgcnRjX2Nsb2NrX3NhdmVkIGZvciB0aGUgcnRjKiBmdW5jdGlvbnMKPiBpbnN0ZWFkLgo+Cj4g
PiArfQo+ID4gKwo+ID4gK3ZvaWQgdHN0X3J0Y3RpbWVfcmVzdG9yZSh2b2lkKQo+ID4gK3sKPiA+
ICsgICAgIHN0YXRpYyBzdHJ1Y3QgdGltZXNwZWMgbW9ub19lbmQsIGVsYXBzZWQ7Cj4gPiArICAg
ICBzdGF0aWMgc3RydWN0IHRpbWVzcGVjIHJ0Y19iZWdpbl90bSwgcnRjX2FkanVzdDsKPiA+ICsg
ICAgIHN0YXRpYyBzdHJ1Y3QgcnRjX3RpbWUgcnRjX3Jlc3RvcmU7Cj4gPiArCj4gPiArICAgICBp
ZiAoIWNsb2NrX3NhdmVkKQo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiArCj4gPiArICAg
ICBjbG9ja19zYXZlZCA9IDA7Cj4gPiArCj4gPiArICAgICBpZiAodHN0X2Nsb2NrX2dldHRpbWUo
Q0xPQ0tfTU9OT1RPTklDX1JBVywgJm1vbm9fZW5kKSkKPiA+ICsgICAgICAgICAgICAgdHN0X2Jy
ayhUQlJPSyB8IFRFUlJOTywgInRzdF9jbG9ja19nZXR0aW1lKCkgbW9ub3RvbmljIGZhaWxlZCIp
Owo+ID4gKwo+ID4gKyAgICAgZWxhcHNlZCA9IHRzdF90aW1lc3BlY19kaWZmKG1vbm9fZW5kLCBt
b25vX2JlZ2luKTsKPiA+ICsKPiA+ICsgICAgIHJ0Y19iZWdpbl90bS50dl9zZWMgPSB0c3RfcnRj
X3RtX3RvX3RpbWUoJnJ0Y19iZWdpbik7Cj4KPiBXZSBzaG91bGQgY2xlYXIgdGhlIHR2X25zZWMg
aGVyZSBvdGhlcndpc2UgaXQgd2lsbCBjb250YWluIGdhcmJhZ2UuClRoZSBydGNfYmVnaW5fdG0g
aXMgZGVmaW5lZCBpbiB0aGlzIGZ1bmN0aW9u77yMIGFuZCB0dl9uc2VjIG5ldmVyIGFzc2lnbmVk
77yMCnNvIEkgdGhpbmsgaXQgd2lsbCBub3QgcHJvZHVjZSBhbnkgZ2FyYmFnZS4KPgo+ID4gKyAg
ICAgcnRjX2FkanVzdCA9IHRzdF90aW1lc3BlY19hZGQocnRjX2JlZ2luX3RtLCBlbGFwc2VkKTsK
PiA+ICsKPiA+ICsgICAgIHRzdF9ydGNfdGltZV90b190bShydGNfYWRqdXN0LnR2X3NlYywgJnJ0
Y19yZXN0b3JlKTsKPiA+ICsKPiA+ICsgICAgIC8qIHJlc3RvcmUgcmVhbHRpbWUgY2xvY2sgYmFz
ZWQgb24gbW9ub3RvbmljIGRlbHRhICovCj4gPiArICAgICBpZiAodHN0X3J0Y19zZXR0aW1lKCZy
dGNfcmVzdG9yZSkpCj4gPiArICAgICAgICAgICAgIHRzdF9icmsoVEJST0sgfCBURVJSTk8sICJ0
c3RfcnRjX3NldHRpbWUoKSByZWFsdGltZSBmYWlsZWQiKTsKPiA+ICt9Cj4KPiBPdGhlciB0aGFu
IHRoaXMsIGl0IGxvb2tzIGdvb2QuCj4KPiAtLQo+IEN5cmlsIEhydWJpcwo+IGNocnViaXNAc3Vz
ZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
