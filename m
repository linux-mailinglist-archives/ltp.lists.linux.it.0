Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0253C4612
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:37:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F108E3C6742
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:37:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7BA203C2FDD
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:37:03 +0200 (CEST)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 91C781A00E0B
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:37:02 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id t17so41876848lfq.0
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 01:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mEUgYCOdDqSUglYqG1dJnJ0Z9fMNUwXlbD5czh4CjtA=;
 b=Lx9XhR0iwDDXSASQKWVlMhO8UY5FfKWDuCwmZuRN9wdbAOa65D/LA7vsLtgsuZoFaH
 s2l0RlA+lz3HfxGCQOzHRESH71XYA7NxpyDiAr213JJ5Agrz+W/1IK+r+WmVhnnHIBU6
 r7LmKOvGCDXknEhkTJCzC6s0TtmoPlQePXeQzy2Effr7oJa6p9QpIV8krEsNDEDcTpx4
 tgsFPn00wng4r3NvYPQ0X8SZkWfgoP5xtoxMKaSaNr6gWAR3UNGT2U5iX5VIV60zDu1r
 tds3+3pptggd1Td1CVWdN5iiSAstuxKCfFQf1J6ojLtYe+LzH6a0GM97a+KXwMXVxrIH
 iAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mEUgYCOdDqSUglYqG1dJnJ0Z9fMNUwXlbD5czh4CjtA=;
 b=MpB5BiunPY9c4phDSlM6/0vX4L3rUPhvc0m1Wz62vthJusn5FkVkHy8C82Hu1z5SL1
 ml9hviIi8Xthi7rH09skudV+wl7OGk03IyvW2BTjlxj0DdHtY9sEWbzLG5PZLuHwTo5E
 IkYjqVJLAa5p12NYDXciEqZOCC4/KqJt51KTZA5c0uG0WxH4GtGCOVP9cbOO73dPo3nb
 Whn61BqagOcCsgIQU8s7n7eEHcgAmwdZuqrSbpS+dEZIjYvnF3MCjVX+4Eq1B9oZ7/0j
 0/94V1/85Akwi+heEfCeQ+4YWlVvKR5pLl4BT8WRww86NuXrTL73Qmt9+P7LtGrCPREF
 bd1g==
X-Gm-Message-State: AOAM530zoBBO3R0sWS8b4CEB69CvTooe3sid+Iy/nuTU9NJM9TP+5Q8O
 LU9JZLNyuO4nXGmIsu6DKHGSHBuXGV2D
X-Google-Smtp-Source: ABdhPJyZZ3tnmvrTp+gWA9+46IsEqkOa/mGOwZknMucXcnELPh0u5uJDxYr9pAKXpDid56r9yr1vJA==
X-Received: by 2002:a05:6512:3147:: with SMTP id
 s7mr1599385lfi.189.1626079021760; 
 Mon, 12 Jul 2021 01:37:01 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id s6sm1147839lfd.171.2021.07.12.01.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 01:37:01 -0700 (PDT)
To: Li Wang <liwang@redhat.com>
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2ehOzddTbDqZBcbyZcnUy3899u_U81XGtckf1Gs_LJGMA@mail.gmail.com>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <af9eb653-4c75-938e-71b1-2e4050b39d26@bell-sw.com>
Date: Mon, 12 Jul 2021 11:37:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2ehOzddTbDqZBcbyZcnUy3899u_U81XGtckf1Gs_LJGMA@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] shmget03: don't depend on existed shared
 resources
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTIuMDcuMjAyMSAxMToyOCwgTGkgV2FuZyB3cm90ZToKPiAKPiAKPiBPbiBNb24sIEp1bCAx
MiwgMjAyMSBhdCAzOjU0IFBNIEFsZXhleSBLb2RhbmV2IDxhbGVrc2VpLmtvZGFuZXZAYmVsbC1z
dy5jb20gPG1haWx0bzphbGVrc2VpLmtvZGFuZXZAYmVsbC1zdy5jb20+PiB3cm90ZToKPiAKPiAg
ICAgSXQncyB1bmxpa2VseSwgYnV0IHN0aWxsIHBvc3NpYmxlIHRoYXQgc29tZSBvZiB0aGVtIGNv
dWxkIGJlCj4gICAgIGNyZWF0ZWQvcmVsZWFzZWQgZHVyaW5nIHRoZSB0ZXN0IGFzIHdlbGwsIHNv
IHRoZSBwYXRjaCBvbmx5Cj4gICAgIGNoZWNrcyBlcnJuby4KPiAKPiAgICAgU2lnbmVkLW9mZi1i
eTogQWxleGV5IEtvZGFuZXYgPGFsZWtzZWkua29kYW5ldkBiZWxsLXN3LmNvbSA8bWFpbHRvOmFs
ZWtzZWkua29kYW5ldkBiZWxsLXN3LmNvbT4+Cj4gICAgIC0tLQo+ICAgICB2MjogKiBNb3ZlIHRo
ZSBsb29wIHRvIHRoZSB0ZXN0IHJ1biBmdW5jdGlvbiBhbmQgdHJ5IHRvIGdldAo+ICAgICDCoCDC
oCDCoCBFTk9TUEMgZXJybm8gdGhlcmUuCj4gCj4gCj4gSSdtIGZpbmUgdG8gZ28gd2l0aCB0aGlz
IGJ1dCBtb3ZlwqB0aGUgbG9vcCB0byB0ZXN0IHJ1biB3aXRob3V0IGFueQo+IGxpbWl0IHdpbGwg
YnJpbmcgbmV3IGZhaWwgaWYgcnVubmluZyB3aXRoIHBhcmFtZXRlciAnLWkgMicuCj4gCj4gV2Ug
aGF2ZSB0byBoYW5kbGUgdGhhdCBzaXR1YXRpb24gKG1heWJlIGFkZCBhIGp1ZGdtZW50IHRvIHNr
aXAKPiB0ZXN0IGZvciBydW7CoG1vcmUgdGltZXMpIGluIGNhc2Ugc29tZW9uZSB1c2VzIGl0IGxp
a2U6CgpPciBqdXN0IHJlbGVhc2UgdGhlbSBhc2FwIGFmdGVyIHRwYXNzPwoKPiAKPiAjIC4vc2ht
Z2V0MDMgLWkgMgo+IHRzdF90ZXN0LmM6MTM0NDogVElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAw
aCAwNW0gMDBzCj4gc2htZ2V0MDMuYzo0NDogVFBBU1M6IE1heGltdW0gbnVtYmVyIG9mIHNlZ21l
bnRzIHJlYWNoZWQgKDQwOTYpLCB1c2VkIGJ5IHRlc3QgNDA5Ngo+IHNobWdldDAzLmM6NDE6IFRG
QUlMOiBGYWlsZWQgdG8gdHJpZ2dlciBFTk9TUEMgZXJyb3I6IEVFWElTVCAoMTcpCj4gCj4gLS0g
Cj4gUmVnYXJkcywKPiBMaSBXYW5nCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
