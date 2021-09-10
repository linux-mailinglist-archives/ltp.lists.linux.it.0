Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3D2406896
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 10:39:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 228D23C86C6
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 10:39:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D6843C21F5
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 10:39:31 +0200 (CEST)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5933E60210A
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 10:39:30 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id s10so2513939lfr.11
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 01:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZirMEoloR79YWCiS++WJKSd9c0lM6359W9XkSdYk5V4=;
 b=M+CUP4juwr/gOoJNv0oZVDsuKwVvSi35czcW3FMd4GlMoA0fUKNJ/QiKjyUj+4JfgJ
 Z1JUyxuDYKcaHI+Q+Yqql/XNgYEIfXC2xS/mMSvFDVY8d5GTSUb/RFUSYwmtbHFSJoFq
 eDeN093k/MwHn14UnrYgX43SeTvxGtvUhnAmnJjZ4Q3wVtqsLtzi1o5NnsX3uyrx3BLy
 sfqHnoUUTpVZBr1Dg9j+kNZ/C1oxvTqRfEYkrZKoBu0TUX94Q9rboDt2ShFHZVRKW3km
 6RazLiYT00u7ELczXx0BnPOyIahTOhG9gAg74biNIOmoCLaCTxz0Q9bGdZ7HerUkASr/
 HF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZirMEoloR79YWCiS++WJKSd9c0lM6359W9XkSdYk5V4=;
 b=Gwsh6ILCX7U44gbUHntF9nG3lmHiyCXpHD6QNwP5Pf9NQ2Xs4kI/z98UDd/88wQ2FF
 M9nOmYQkxkp7INNZIWWosCpXfZAy7SEwA1TSJvRJOK/sa00lSiGxtKGZd2fQpdYmlRQs
 8g45flCcgjs3CoSrImGGqK+wJUrxG6BoZZTbUnNYhfVIB9Hh3qd0qrTmYlioIVEIHx+r
 wa5ms1Se3TBf8jg2tl1qzobh2i+qlq+WnKEpTX4JI7YRuD9smcFaJrOLrRF7P3vl8lPk
 JYK6saQWysOGHelmOFPdYIqovwqb2YGYGt2GaQx2eprraqk8p4yTtlbIY+EWPNip0Xdg
 wb5A==
X-Gm-Message-State: AOAM531tiKBXuQ7tYfHLmgRYLGrvP4RQQwvJV0+d4MZX4QgiBu8Z+fRt
 bl6ZPHby6T2aCpWXbpQLKs+AYGd/sGOw
X-Google-Smtp-Source: ABdhPJzcZkGDojJeZOPSSNxfgADfYyzmJr/itZWaq6ltShuqOCsRnLcuueApkdmlhGlTQTVefugnvA==
X-Received: by 2002:a05:6512:220c:: with SMTP id
 h12mr2949344lfu.398.1631263169513; 
 Fri, 10 Sep 2021 01:39:29 -0700 (PDT)
Received: from [192.168.1.52] ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id j20sm467188lfu.165.2021.09.10.01.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 01:39:29 -0700 (PDT)
To: pvorel <pvorel@suse.de>, suy.fnst@fujitsu.com
References: <TY2PR01MB212429263FC238F44A2C1D7D89C79@TY2PR01MB2124.jpnprd01.prod.outlook.com>
 <410b2b2d-9633-7a57-527a-1663afe5f631@bell-sw.com>
 <TY2PR01MB21246C459BBCD763BD1C0CBD89CB9@TY2PR01MB2124.jpnprd01.prod.outlook.com>
 <0acf816462d49d8a6004c87e36b05d1b@suse.de>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <8d93deac-eec1-5f87-57a5-c72b2f6e5973@bell-sw.com>
Date: Fri, 10 Sep 2021 11:39:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0acf816462d49d8a6004c87e36b05d1b@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/mpls: sleep 1 after setup in mpls02
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

T24gMDkuMDkuMjAyMSAxODo1MywgcHZvcmVsIHdyb3RlOgo+IEhpIFN1LCBBbGV4ZXksCj4gCj4g
T24gMjAyMS0wOC0zMCAxMToyNiwgc3V5LmZuc3RAZnVqaXRzdS5jb20gd3JvdGU6Cj4+IEhpLAo+
PiDCoCBJIGZvdW5kIHRoYXQgaXQncyBpbmRlZWQgcmVsYXRlZCB0byBpcHY2IERBRCBhcyB5b3Ug
c2FpZC4KPj4gQ2FsbGluZwo+PiBgaXAgbmV0bnMgZXhlYyBsdHBfbnMgc3lzY3RsIC1uIG5ldC5p
cHY2LmNvbmYubHRwX25zX3ZldGgxLmFjY2VwdF9kYWQ9MGAKPj4gb3IgdHN0X3dhaXRfaXB2Nl9k
YWQoKSBhdCBlbmQgb2YgdGhlIHNldHVwIGJvdGggc29sdmVzIHRoZSBwcm9ibGVtLgo+PiBIb3dl
dmVyIHRoZXJlIGlzIG9uZSBzdXBlciBzdHJhbmdlIHBhcnQgdGhhdCB0aGUgdGVudGF0aXZlIGFk
ZHJlc3MgaXMKPj4gdGhlIGxvY2FsIGxpbmsgYWRyZXNzIG9mIHRoZSBsdHBfbnNfdmV0aDE6Cj4+
Cj4+IDU6IGx0cF9uc192ZXRoMUBpZjQ6IDxCUk9BRENBU1QsVVAsTE9XRVJfVVA+IG10dSAxNTAw
IHFkaXNjIG5vcXVldWUKPj4gc3RhdGUgVVAgZ3JvdXAgZGVmYXVsdCBxbGVuIDEwMDAKPj4gwqDC
oMKgIGxpbmsvZXRoZXIgZjI6OGY6MjQ6ZDQ6YmE6MjYgYnJkIGZmOmZmOmZmOmZmOmZmOmZmIGxp
bmstbmV0bnNpZCAwCj4+IMKgwqDCoCBpbmV0IDEwLjAuMC4xLzI0IHNjb3BlIGdsb2JhbCBsdHBf
bnNfdmV0aDEKPj4gwqDCoMKgwqDCoMKgIHZhbGlkX2xmdCBmb3JldmVyIHByZWZlcnJlZF9sZnQg
Zm9yZXZlcgo+PiDCoMKgwqAgaW5ldDYgZmQwMDoxOjE6MTo6MS82NCBzY29wZSBnbG9iYWwgbm9k
YWQKPj4gwqDCoMKgwqDCoMKgIHZhbGlkX2xmdCBmb3JldmVyIHByZWZlcnJlZF9sZnQgZm9yZXZl
cgo+PiDCoMKgwqAgaW5ldDYgZmU4MDo6ZjA4ZjoyNGZmOmZlZDQ6YmEyNi82NCBzY29wZSBsaW5r
IHRlbnRhdGl2ZQo+PiA8LS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoMKgwqDCoMKgwqAgdmFsaWRf
bGZ0IGZvcmV2ZXIgcHJlZmVycmVkX2xmdCBmb3JldmVyCj4+Cj4+IEhvd2V2ZXIsIHRoZXJlIGlz
IG5vIHBsYWNlIHVzaW5nIHRoZSBhZGRyZXNzIGluIG1wbHMwMiB0ZXN0Lj4+IEl0IG1ha2VzIG1l
IHdvbmRlciBob3cgY291bGQgaXQgYmUgcG9zc2libGUgdG8gdHJpZ2dlciB0aGUgaXNzdWUuLgoK
TG9va3MgbGlrZSB0aGUgcHJvYmxlbSBoZXJlIGluIHRoZSBuZWlnaGJvciBkaXNjb3Zlcnkgb2Yg
ZmQwMDoxOjE6MTo6Mgp1c2luZyBsaW5rLWxvY2FsIGFkZHJlc3MsIGFuZCB2aWNlIHZlcnNlIGZv
ciB0aGUgb3RoZXIgc2lkZS4gbXBscyBpcwp1c2luZyB0aGUgZm9sbG93aW5nIHJvdXRlIHdpdGgg
dGhlIGFkZHJlc3M6CgpmZDAwOjIzOjoyICBlbmNhcCBtcGxzICA2MCB2aWEgZmQwMDoxOjE6MTo6
MiBkZXYgbHRwX25zX3ZldGgxIG1ldHJpYyAxMDI0IHByZWYgbWVkaXVtCnNvIHRoZSBhZGRyZXNz
IHRoZXJlIHNob3VsZCBiZSBpbiBhIHJlYWNoYWJsZSBzdGF0ZS4uLgoKQWRkaW5nIGl0IG1hbnVh
bGx5IGluIHNldHVwIG1pZ2h0IGZpeCB0aGUgdGVzdCBhcyB3ZWxsOgoKUk9EIGlwIG5laWdoIHJl
cGxhY2UgJCh0c3RfaXBhZGRyIHJob3N0KSBsbGFkZHIgJCh0c3RfaHdhZGRyIHJob3N0KSBkZXYg
JCh0c3RfaWZhY2UpIG51ZCByZWFjaGFibGUKdHN0X3Job3N0X3J1biAtcyAtYyAiaXAgbmVpZ2gg
cmVwbGFjZSAkKHRzdF9pcGFkZHIpIGxsYWRkciAkKHRzdF9od2FkZHIpIGRldiAkKHRzdF9pZmFj
ZSByaG9zdCkgbnVkIHJlYWNoYWJsZSIKCj4gCj4gSSB3b25kZXIgaWYgdGVzdCBzdGlsbCBuZWVk
cyBiZSBmaXhlZCB0byB3b3JrIG9uIGFsbCBzZXR1cHMuCj4gCgpJIHRoaW5rIHdlIGNvdWxkIHNl
dCBhY2NlcHRfZGFkIHRvIDAgaW4gZ2VuZXJpYyBzZXR1cCBvZiB0aGUKdGVzdCBpbnRlcmZhY2Vz
LCBpbiB0c3RfbmV0LnNoL3RzdF9pbml0X2lmYWNlKCkuCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
