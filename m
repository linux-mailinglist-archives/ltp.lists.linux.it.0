Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2B1EACC9
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:45:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B9F63C22FE
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:45:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4FDAE3C22AB
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:45:10 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 24AA720113E
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572515107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6UuwwfC85J6aJqDHM9AXzlz8m4T4NJkDjEEtx9p1/A=;
 b=PVw7PFDbYsLXsyjUg7hLpR4YmGlLzOs8U6O+0+7u3NRgQglVcZKzEZI+GB0dShompjgHvo
 3v2ItC39+Ng8kaNsp3qElvQaajm4Uwhw8dnvrPiGGdTvozGEeZ7YsjdafBXIPizAhtlLOS
 emhek12ydy1K9ChEJEVyLHL3B87aUv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-8vqJouDUMriR_wbU93wJDw-1; Thu, 31 Oct 2019 05:36:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BD4D800EB5;
 Thu, 31 Oct 2019 09:36:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D23060BFB;
 Thu, 31 Oct 2019 09:36:32 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21ABA4BB5B;
 Thu, 31 Oct 2019 09:36:32 +0000 (UTC)
Date: Thu, 31 Oct 2019 05:36:31 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: limingyu <limingyu@deepin.com>
Message-ID: <1615187401.9901286.1572514591876.JavaMail.zimbra@redhat.com>
In-Reply-To: <tencent_4D69C182358CFFEA3F0A95F7@qq.com>
References: <tencent_4D69C182358CFFEA3F0A95F7@qq.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.22]
Thread-Topic: Unable to run eventfd test,
 even the libaio-dev installed on debian 10.
Thread-Index: RA29BC4y4esVeJGMrIoHZ8+iJxgABw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 8vqJouDUMriR_wbU93wJDw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] Unable to run eventfd test,
 even the libaio-dev installed on debian 10.
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
Cc: =?utf-8?B?5rSq5rWp?= <honghao@linuxdeepin.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBXaGVuIEkgdHJ5IHRvIHJ1biBldmVudGZk
IHRlc3RjYXNlIHVuZGVyIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMsIGl0IHR1cm5zCj4gb3V0
IHRoYXQgSSBzaG91bGQgaW5zdGFsbCBsaWJhaW8tZGV2IHBhY2thZ2VzLiBCdXQgaXQgZGlkbid0
IGhlbHBzIHdoZW4gSSBETwo+IGluc3RhbGxlZCB0aGUgcGFja2FnZS4KPiAKPiBsZWVtZWFuc0Bk
ZWVwaW46L21lZGlhL2xlZW1lYW5zL2xlYXJuaW5nL0dpdHByb2plY3RzL2x0cC90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2V2ZW50ZmQkCj4gZHBrZyAtbCB8IGdyZXAgbGliYWlvaWkgbGliYWlv
LWRldjphbWQ2NCAwLjMuMTEyLTMgYW1kNjQgTGludXgga2VybmVsIEFJTwo+IGFjY2VzcyBsaWJy
YXJ5IC0gZGV2ZWxvcG1lbnQgZmlsZXMKPiBpaSBsaWJhaW8xOmFtZDY0IDAuMy4xMTItMyBhbWQ2
NCBMaW51eCBrZXJuZWwgQUlPIGFjY2VzcyBsaWJyYXJ5IC0gc2hhcmVkCj4gbGlicmFyeQo+IGxl
ZW1lYW5zQGRlZXBpbjovbWVkaWEvbGVlbWVhbnMvbGVhcm5pbmcvR2l0cHJvamVjdHMvbHRwL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZXZlbnRmZCQKPiBtYWtlICYmIHN1ZG8gLi9ldmVudGZk
MDEKPiBtYWtlIC1DICIvbWVkaWEvbGVlbWVhbnMvbGVhcm5pbmcvR2l0cHJvamVjdHMvbHRwL2xp
YiIgLWYKPiAiL21lZGlhL2xlZW1lYW5zL2xlYXJuaW5nL0dpdHByb2plY3RzL2x0cC9saWIvTWFr
ZWZpbGUiIGFsbAo+IG1ha2VbMV06IOi/m+WFpeebruW9leKAnC9tZWRpYS9sZWVtZWFucy9sZWFy
bmluZy9HaXRwcm9qZWN0cy9sdHAvbGli4oCdCj4gbWFrZVsyXTog6L+b5YWl55uu5b2V4oCcL21l
ZGlhL2xlZW1lYW5zL2xlYXJuaW5nL0dpdHByb2plY3RzL2x0cC9saWIvdGVzdHPigJ0KPiBtYWtl
WzJdOiDlr7nigJxhbGzigJ3ml6DpnIDlgZrku7vkvZXkuovjgIIKPiBtYWtlWzJdOiDnprvlvIDn
m67lvZXigJwvbWVkaWEvbGVlbWVhbnMvbGVhcm5pbmcvR2l0cHJvamVjdHMvbHRwL2xpYi90ZXN0
c+KAnQo+IG1ha2VbMl06IOi/m+WFpeebruW9leKAnC9tZWRpYS9sZWVtZWFucy9sZWFybmluZy9H
aXRwcm9qZWN0cy9sdHAvbGliL25ld2xpYl90ZXN0c+KAnQo+IG1ha2VbMl06IOWvueKAnGFsbOKA
neaXoOmcgOWBmuS7u+S9leS6i+OAggo+IG1ha2VbMl06IOemu+W8gOebruW9leKAnC9tZWRpYS9s
ZWVtZWFucy9sZWFybmluZy9HaXRwcm9qZWN0cy9sdHAvbGliL25ld2xpYl90ZXN0c+KAnQo+IG1h
a2VbMV06IOemu+W8gOebruW9leKAnC9tZWRpYS9sZWVtZWFucy9sZWFybmluZy9HaXRwcm9qZWN0
cy9sdHAvbGli4oCdCj4gZXZlbnRmZDAxIDEgVENPTkYgOiBldmVudGZkMDEuYzo3MzM6IHRlc3Qg
cmVxdWlyZXMgbGliYWlvIGFuZCBpdCdzCj4gZGV2ZWxvcG1lbnQgcGFja2FnZXMKPiBldmVudGZk
MDEgMiBUQ09ORiA6IGV2ZW50ZmQwMS5jOjczMzogUmVtYWluaW5nIGNhc2VzIG5vdCBhcHByb3By
aWF0ZSBmb3IKPiBjb25maWd1cmF0aW9uCj4gCj4gQWZ0ZXIgZ28gdGhyb3VnaCB0aGUgaW50ZXJu
ZXQsIGl0IHR1cm5zIG91dCB0aGF0IEkgbmVlZCBjb25mZGVmcy5oIHdoaWNoIGlzCj4gZ2VuZXJh
dGVkIGJ5IHRoZSBjb25maWd1cmUgc2NyaXB0LiBJIHRyaWVkIHJlLXJ1biB0aGUgY29uZmlndXJl
IGJ1dCBpdAo+IGRpZG4ndCBoZWxwcyB0b28uIEkgY2FuJ3QgZmluZCB0aGUgZ2VuZXJhdGVkIGNv
bmZkZWYuaCEKPiAKPiBBbnlib2R5IGhhdmUgYW55IGlkZWFzLCBwbGVhc2U/Cj4gCgpBZnRlciB5
b3UgcnVuIC4vY29uZmlndXJlLCBsb29rIGF0IGNvbmZpZy5sb2cgdG8gc2VlIHdoYXQgKmFpbyBj
aGVja3MgZmFpbGVkLgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
