Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1370D17E3A4
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 16:31:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65AA03C6136
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 16:31:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 134583C1809
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 16:17:39 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5C202200FD1
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 16:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583767056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1e0UDrkBPUyrAguNNnpVKSpAJg+IPN8ZlH5RA96xjME=;
 b=Pvb3V5v1z83gJtQWcG668GmL1HDoUk5PowpzluRmvuax4+sOQhHP66VPgLnaMTZKHHZY1C
 OgQakINiXd5F3gVgX0vwImCf//hHuoG6bzPQq+sBwt1AcQigRRMwwTU5UPcoUoYcssrZoL
 YZKZIn6gEEIHtTrAmwB/xq/Ub773Zd0=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-J8rE8IbsNkOhokM50xDVwQ-1; Mon, 09 Mar 2020 11:17:34 -0400
X-MC-Unique: J8rE8IbsNkOhokM50xDVwQ-1
Received: by mail-oi1-f199.google.com with SMTP id 16so5801622oii.18
 for <ltp@lists.linux.it>; Mon, 09 Mar 2020 08:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1e0UDrkBPUyrAguNNnpVKSpAJg+IPN8ZlH5RA96xjME=;
 b=QW2kb3y+mrJgSQedKSkMcAFPCzl16lkuWeRkM/y6IRXwFHmD0hPSD1xMu7Nyt6KLm+
 MUI5J9CcL9nWUjurNpEBtyXfqYTXFlmHIBiaGwQwLcpC+S5JJhcUQUgo8Lviq0nx20Bl
 mc/fJvhXjx1V/jbtawL4PBt3j1SCVwzJrho/KicXpF01RonSg/MLH3lH61p+ULsKE+13
 qSbCS5zFGWPneFilN3Flhirbr4OFtCRHNyDv4383j9J4/n+M2vh8KK3WiY4puCeagpyO
 EsfFB8i5bulTDSvqhH8899ebOPW/iz/Veo1jl/J2nRdZwKK9Bv1SM+cG2X1Loj7HJx5T
 5OuA==
X-Gm-Message-State: ANhLgQ0bXPZ26Zy6qDlpKGHpHb7fWr+UH6s2LWnFPux3YjHy+lhyDQlr
 o2pMkIKn2YIqm7B1KLmLkpnUjHE9E3+hk4wX2b9B3h2kX/z9mYGsTuNVZHvSX8JH2SsxmI/lVto
 CwzCvik2p3oK2Eae6lk+Kux8JD98=
X-Received: by 2002:a9d:7458:: with SMTP id p24mr1628814otk.197.1583767053643; 
 Mon, 09 Mar 2020 08:17:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvlTbqVRGDToaBrcpAC008+c4AQmhJQ396jw+RakqLLaDOCCrwEFXqHa9659OG9AS1/hAxN68/6hGbh907t+P0=
X-Received: by 2002:a9d:7458:: with SMTP id p24mr1628774otk.197.1583767053213; 
 Mon, 09 Mar 2020 08:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <cki.2EFDE2FCE3.JLIPSG6DVZ@redhat.com>
In-Reply-To: <cki.2EFDE2FCE3.JLIPSG6DVZ@redhat.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Mon, 9 Mar 2020 16:17:22 +0100
Message-ID: <CAFqZXNsahRxaAmH0vdzs29mXkViKjng8rRi2E70FS7eNSFW=oA@mail.gmail.com>
To: CKI Project <cki-project@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 09 Mar 2020 16:31:32 +0100
Subject: Re: [LTP] 
	=?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E6?=
	=?utf-8?b?LjAtMC5yYzQuMi5lbHJkeS5ja2kgKGFyayk=?=
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
Cc: Milos Malik <mmalik@redhat.com>, David Arcari <darcari@redhat.com>,
 Memory Management <mm-qe@redhat.com>, Jeremy Cline <jcline@redhat.com>,
 Xiaowu Wu <xiawu@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gU2F0LCBNYXIgNywgMjAyMCBhdCAxOjAyIEFNIENLSSBQcm9qZWN0IDxja2ktcHJvamVjdEBy
ZWRoYXQuY29tPiB3cm90ZToKPiBIZWxsbywKPgo+IFdlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24g
YSByZWNlbnQgY29tbWl0IGZyb20gdGhpcyBrZXJuZWwgdHJlZToKPgo+ICAgICAgICBLZXJuZWwg
cmVwbzogaHR0cHM6Ly9naXRsYWIuY29tL2NraS1wcm9qZWN0L2tlcm5lbC1hcmsuZ2l0Cj4gICAg
ICAgICAgICAgQ29tbWl0OiA3NmZmNTIwOGVkOTggLSBbcmVkaGF0XSBrZXJuZWwtNS42LjAtMC5y
YzQuMi5lbHJkeQo+Cj4gVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBw
cm92aWRlZCBiZWxvdy4KPgo+ICAgICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWls
cyBiZWxvdykKPiAgICAgICAgICAgICAgTWVyZ2U6IE9LCj4gICAgICAgICAgICBDb21waWxlOiBP
Swo+ICAgICAgICAgICAgICBUZXN0czogRkFJTEVECj4KPiAgICAgUGlwZWxpbmU6IGh0dHBzOi8v
eGNpMzIubGFiLmVuZy5yZHUyLnJlZGhhdC5jb20vY2tpLXByb2plY3QvY2tpLXBpcGVsaW5lL3Bp
cGVsaW5lcy80NzUxNDkKPgo+IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4gICBU
byB2aWV3IGV4aXN0aW5nIG9yIGxvZyBuZXcgZmFpbHVyZXMgaW4gQ0tJOgo+ICAgICBodHRwOi8v
aW50ZXJuYWwtZG9jdW1lbnRhdGlvbi1hcmsuY2xvdWQucGFhcy5wc2kucmVkaGF0LmNvbS9kYXRh
d2FyZWhvdXNlL2ZhaWx1cmVfYW5hbHlzaXMvI3ZpZXcta25vd24tZmFpbHVyZXMKPiAgIFRvIHZp
ZXcgdGVzdGluZyB0cmVuZHMgcGVyIGtlcm5lbCwgZS5nLiBkZXRlcm1pbmUgaWYgYSB0ZXN0IGZh
aWxlZCBvbiBwcmV2aW91cyBrZXJuZWxzOgo+ICAgICBodHRwOi8vaW50ZXJuYWwtZG9jdW1lbnRh
dGlvbi1hcmsuY2xvdWQucGFhcy5wc2kucmVkaGF0LmNvbS9kYXRhd2FyZWhvdXNlL2ZhaWx1cmVf
YW5hbHlzaXMvI3Rlc3QtcmVzdWx0cwo+Cj4gICAgIHg4Nl82NDoKPiAgICAgIOKdjCBMVFAKPiAg
ICAgIOKdjCBMaWJodWdldGxiZnMgLSB2ZXJzaW9uIDIuMi4xCj4gICAgICDinYwgVHJhY2Vwb2lu
dHM6IG9wZXJhdGlvbmFsIHRlc3QKCj4gICAgICDinYwgc2VsaW51eC1wb2xpY3k6IHNlcmdlLXRl
c3RzdWl0ZQoKRldJVywgdGhlIFNFTGludXggdGVzdHN1aXRlIGZhaWxlZCBvbiB0aGUgQlBGIHN1
YnRlc3QgZHVlIHRvCnVucHJpdmlsZWdlZCBCUEYgYmVpbmcgZGlzYWJsZWQgb24gQVJLIGtlcm5l
bHMgKGFuZCB0aGUgcmxJc1JIRUwgY2hlY2sKZGlkbid0IGNvdmVyIGl0LCBzaW5jZSB0aGlzIHdh
cyBydW4gb24gRmVkb3JhLi4uKS4gSSBvcGVuZWQgYSBQUiB0bwpmaXggb3VyIHRlc3Qgd3JhcHBl
ciB0byBiZXR0ZXIgZGV0ZWN0IGNhc2VzIHdoZW4gQ0FQX1NZU19BRE1JTiBpcwpuZWVkZWQgdG8g
ZG8gQlBGIHN0dWZmIGFuZCBhbHNvIHRvIGFjdHVhbGx5IHJ1biB0aGUgc3VidGVzdCAoZ3JhbnRp
bmcKdGhlIHN5c19hZG1pbiBjYXBhYmlsaXR5IHRvIHRoZSByZWxldmFudCBkb21haW5zKSBpbiBz
dWNoIGNhc2UgaW5zdGVhZApvZiBqdXN0IGRpc2FibGluZyBpdC4KCi0tIApPbmRyZWogTW9zbmFj
ZWsgPG9tb3NuYWNlIGF0IHJlZGhhdCBkb3QgY29tPgpTb2Z0d2FyZSBFbmdpbmVlciwgU2VjdXJp
dHkgVGVjaG5vbG9naWVzClJlZCBIYXQsIEluYy4KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
