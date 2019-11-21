Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DF0104DF4
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:31:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EEF923C1CA3
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:31:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AC0413C04F9
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:31:07 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 3A39C201115
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:31:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574325065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nytQKz4O8T38+xjeV+B4QzdSfAHoXh5rt2VmBr9ylsc=;
 b=MDx017jCjHa3IhG4GtWXT2DvDRk/wlnUifnHUFuEb53RiAMPfXg8Hw5L4dTFoaJHD9+F8b
 h9cglBBXrAK2j2+1M+b8ltMQckGFe0m1YjbMmcNAmXk9XQEhPSDzpT+stJV+tNynjR0/JL
 o3xib3g3IBJgq4dK0Qxr3OVdCW3RvPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-WKdr_4ZqMRG_80Nf-EerBw-1; Thu, 21 Nov 2019 03:31:02 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ED2E1005509;
 Thu, 21 Nov 2019 08:31:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86BF45DAB0;
 Thu, 21 Nov 2019 08:31:01 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A79A18089C8;
 Thu, 21 Nov 2019 08:31:01 +0000 (UTC)
Date: Thu, 21 Nov 2019 03:31:01 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <1019476919.13283233.1574325061298.JavaMail.zimbra@redhat.com>
In-Reply-To: <d76d2ad2-f302-3cd5-0c9f-5d96a6a4bd55@suse.cz>
References: <20191119094156.20348-1-liwang@redhat.com>
 <1860355560.12961927.1574161647388.JavaMail.zimbra@redhat.com>
 <CAEemH2cN8qv_YpsFKJazcOKEvgfjXpacZOV_Er-0bjK86=6VpQ@mail.gmail.com>
 <c9d278e6-5700-6c16-019b-1770a6ede0ff@suse.cz>
 <CAEemH2dZCm5MVyhzWiFKVK-jt+UUw65u5CRFk-moUVUgpDHHWg@mail.gmail.com>
 <d76d2ad2-f302-3cd5-0c9f-5d96a6a4bd55@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.19]
Thread-Topic: tst_fill_fs: enhance the filesystem filling routine
Thread-Index: pNysXiBozUrQSCa+GfcEgalZJLGWKg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: WKdr_4ZqMRG_80Nf-EerBw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_fill_fs: enhance the filesystem filling
 routine
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBPbiAxMS8yMC8xOSAzOjE5IEFNLCBMaSBX
YW5nIHdyb3RlOgo+ID4gICAgIFlvdSBkb24ndCBuZWVkIHRvIHJlZHVjZSB0aGUgd3JpdGUgc2l6
ZSBpbiB0aGUgZmlyc3QgcGxhY2UuIEtlcm5lbCB3aWxsCj4gPiAgICAgaGFwcGlseSBkbyBzaG9y
dCB3cml0ZXMgZm9yIHlvdSBpZiB0aGUgZmlsZSBzeXN0ZW0gc29tZWhvdyBmaW5kcyBzb21lCj4g
PiAKPiA+IAo+ID4gWW91J3JlIHByb2JhYmx5IHJpZ2h0LCBidXQgaGVyZSBJIGp1c3Qgd2FudCB0
byBlbmhhbmNlIHRoZSB0c3RfZmlsbF9mcwo+ID4gcm91dGluZSwgaXQgb2J2aW91c2x5IGNvdWxk
bid0wqAgYmUgZ3VhcmFudGVlZCB3YXkgdG8gcGVyZmVjdGx5IGZpbGwgYQo+ID4gZmlsZXN5c3Rl
bSwgdGhpcyBhY3Rpb24gZnJvbSB1c2Vyc3BhY2UgaXMgd2hhdCBJIGNhbiB0aGluayBvZi4KPiAK
PiBJIHdhcyBhbHNvIHRhbGtpbmcgYWJvdXQgZW5oYW5jaW5nIHRzdF9maWxsX2ZzKCkuIFlvdSBj
YW4gc2ltcGx5IHJlcGVhdAo+IHdyaXRlKClzIHdpdGggdGhlIG1heGltdW0gc2l6ZSB1bnRpbCB5
b3UncmUgc3VyZSB0aGUgZmlsZSBzeXN0ZW0gaXMKPiByZWFsbHkgZnVsbC4KCkknZCByYXRoZXIg
d2UgbWlycm9yIHhmc3Rlc3RzLCB3aGljaCBoYWx2ZXMgdGhlIGxlbmd0aCBvbiBFTk9TUEMuCgo+
IFJlZHVjaW5nIHRoZSB3cml0ZSBzaXplIGFuZCB0aGVuIGFsc28gdXNpbmcgdGhlIHdyaXRlIHNp
emUKPiBhcyBpdGVyYXRpb24gY291bnRlcgoKV2UgY291bGQgZG8gZml4ZWQgbnVtYmVyIG9mIHJl
dHJpZXMuIEluIHRoZSBlbmQgaXQgc3RpbGwgZmVlbHMKbGlrZSByYWluIGRhbmNlLgoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
