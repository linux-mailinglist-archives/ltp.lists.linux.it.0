Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C741D08C6
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 08:39:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F422C3C24B3
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 08:39:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 057EB3C2266
 for <ltp@lists.linux.it>; Wed, 13 May 2020 08:39:26 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BA31E600B05
 for <ltp@lists.linux.it>; Wed, 13 May 2020 08:39:07 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id f23so6679886pgj.4
 for <ltp@lists.linux.it>; Tue, 12 May 2020 23:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=+q1HANontRsRm0l9k6PoObNy53R/Je8QSjg+ElgTPJI=;
 b=A1MIKDA57PTbA/7c0wirem3ZqKgOXu3p3KY8BSC5EmDl7qinLfhwH1ur3+PrYIst4G
 2uZ9SkoPbhNL0l5qFcXZkJ4jxaovVSWk7Dj/j9KuY1PJDDxVs9myFRgGW6bsYkG45mre
 8y8xMqcNcWTBn4i+f5feMLeeYBTSeBcfRUEFSLoMjsLOEDjsi0ozDFWpzhXvaNbrnhGG
 uRpVcnMEgij2mUTPW4Seo5W6Sx5PZ5yhnTxRPx9yz1mHRpohftOiT/UfD51GpwCvDufJ
 cP4Dr3YEh/g0QYKaxDwTMasrhkKOnEotBpfnuiw734U9fdbCcqpDtW672vciIxzzzo2X
 2nAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+q1HANontRsRm0l9k6PoObNy53R/Je8QSjg+ElgTPJI=;
 b=QeB2tG2gGKhflXKtLo3pqoBP2Je49wIjF7Xtmy8NG6mQuhZf79/pV2eHp+GNDRwb4S
 RjyChxBmU+JnhWfrdgTDMt9aRbOh4V1Fa62MNxureJN1nyYnos12mGF76969Z04JQVy7
 Uy7zBEimUbju4u22extBjVum2eznPis5VLVNbtavjLxYtCMv0klI6Ka+rtIuaeN2vbwH
 B3JAX+KoHujGzopcrdsqM6ukF+Gs6KR791zVA3KOcjkLXDUu3WZKgzRBzEZlAX032aBw
 8nG6sG8UIIUdEocM63KuguPzKRdmTiz/WS2Wo+bHuJUEyt9O05RSYDAh3qIaIcbPtwO9
 ygTA==
X-Gm-Message-State: AOAM533SyqBELuUhOMiC3ROhVgAtuc9ZAHRhy/emAk/61hqwERepkkvd
 UuBF0ek1o1+FpQvTWyKixIM3yw==
X-Google-Smtp-Source: ABdhPJxE2+Lc3lWHkWW5Ti1gjE0bfThFW3brlKcsNPPELys5AYYIDp8iUYfbcirAs4IILfLBmhqz1w==
X-Received: by 2002:a63:3609:: with SMTP id d9mr13039697pga.354.1589351964771; 
 Tue, 12 May 2020 23:39:24 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id k10sm13839078pfa.163.2020.05.12.23.39.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 23:39:24 -0700 (PDT)
Date: Wed, 13 May 2020 12:09:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200513063922.vetbmhn35cbrdydk@vireshk-i7>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <20200513012626.1571-2-yangx.jy@cn.fujitsu.com>
 <20200513055533.ipmghf2oacc22mzy@vireshk-i7>
 <5EBB8DAA.5080509@cn.fujitsu.com>
 <20200513061343.mjhmciatmx4sw2ub@vireshk-i7>
 <5EBB944F.5010303@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5EBB944F.5010303@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/pidfd_open*.c: Drop .min_kver flag
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

T24gMTMtMDUtMjAsIDE0OjMxLCBYaWFvIFlhbmcgd3JvdGU6Cj4g5LqOIDIwMjAvNS8xMyAxNDox
MywgVmlyZXNoIEt1bWFyIOWGmemBkzoKPiA+IE9uIDEzLTA1LTIwLCAxNDowMywgWGlhbyBZYW5n
IHdyb3RlOgo+ID4gPiBDb3VsZCB5b3UgdGVsbCB3aGljaCBpc3N1ZSBoYXBwZW4/IFRoYW5rcyBh
IGxvdC4KPiA+ID4gVGhlIG90aGVyIHR3byBkb24ndCBuZWVkIHRoZSBleHRyYSBjaGVjayBiZWNh
dXNlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZgo+ID4gPiBwaWRmZF9vcGVuKCkgY2FuIGRvIGl0IHdl
bGwuICBGb3IgM3JkIHRlc3QsIEkgd2FudCB0byBjaGVjayB0aGUgc3VwcG9ydCBvZgo+ID4gPiBw
aWRmc19vcGVuKCkgYmVmb3JlIGRvaW5nIGZvcmsoKS4KPiA+IAo+ID4gV2hhdCBJIG1lYW50IHdh
cyB0aGF0IHRoZSBzb2x1dGlvbiBuZWVkcyB0byBiZSBjb25zaXN0ZW50IGFjcm9zcwo+IEhpIFZp
cmVzaCwKPiAKPiBDdXJyZW50IGNoYW5nZSBjYW4gZG8gY29ycmVjdCBjaGVjayBmb3IgcGlkZmRf
b3BlblsxLTNdIHNvIGRvbid0IG5lZWQgdG8gYWRkCj4gcmVkdW5kYW50IGNoZWNrLgoKSG93IHdp
bGwgYSBjaGVjayBmcm9tIGZpbGUgMDMuYyBjaGVjayBpdCBmb3IgMDEuYyBvciAwMi5jID8KCj4g
PiB0ZXN0cy4gRm9yIGV4YW1wbGUsIHdpdGggdGhlIGN1cnJlbnQgY2hhbmdlIHRoZSBydW4oKSBm
dW5jdGlvbiB3aWxsCj4gPiBydW4gZm9yIGFsbCB0ZXN0cyBpbiBwaWRmZF9vcGVuMDIuYyBhbmQg
cHJpbnQgdGhlIG1lc3NhZ2UgdGhhdCBzeXNjYWxsCj4gPiBpc24ndCBzdXBwb3J0ZWQsIHdoaWxl
IGl0IHdvdWxkIGJlIGJldHRlciB0byBydW4gaXQgb25seSBvbmNlIGluIHNldHVwCj4gPiBhbmQg
Z2V0IGRvbmUgd2l0aCBpdC4gaS5lLiAxIG1lc3NhZ2UgaW5zdGVhZCBvZiAzIHNpbWlsYXIgb25l
cy4KPiA+IAo+IAo+IEFyZSB5b3Ugc3VyZT8KPiAKPiBUcmlnZ2VyaW5nIGZpcnN0IHRzdF9icmso
VENPTkYsIC4uLikgd2lsbCBicmVhayB0aGUgd2hvbGUgdGVzdCBpbnN0ZWFkIG9mIGEKPiBzdWJ0
ZXN0LgoKQWhoLCB5ZXMuIEkgbWlzc2VkIHRoZSB0c3RfYnJrIHBhcnQgOigKCkJ1dCBJIHdpbGwg
c3RpbGwgbGlrZSBpdCB0byBiZSBjb25zaXN0ZW50IGFjcm9zcyBmaWxlcy4gQnV0IGFueXdheSwK
d2hhdGV2ZXIgeW91IGFuZCBDeXJpbCBkZWNpZGUgaXMgZmluZSA6KQoKVGhhbmtzLgoKLS0gCnZp
cmVzaAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
