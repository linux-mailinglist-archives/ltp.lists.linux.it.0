Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CC9341B9
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 10:23:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEEDD3EAB09
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 10:23:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D87D83EAB05
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 10:23:37 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9355010005F5
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 10:23:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B942A2F8BEC;
 Tue,  4 Jun 2019 08:23:34 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52BB55C1A1;
 Tue,  4 Jun 2019 08:23:32 +0000 (UTC)
Date: Tue, 4 Jun 2019 16:23:31 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>, chrubis@suse.cz
Message-ID: <20190604082331.uunxtzshdgcnv4xg@XZHOUW.usersys.redhat.com>
References: <20190604074035.4523-1-xzhou@redhat.com>
 <5CF62756.3000608@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF62756.3000608@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 04 Jun 2019 08:23:35 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] lib/tst_test.c: set mount_device amd
 format_device of	all_filesystems is set
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpPbiBUdWUsIEp1biAwNCwgMjAxOSBhdCAwNDowOTo1OFBNICswODAwLCBYaWFvIFlhbmcg
d3JvdGU6Cj4gT24gMjAxOS8wNi8wNCAxNTo0MCwgTXVycGh5IFpob3Ugd3JvdGU6Cj4gPiBwcmVh
ZHYyMDMuYyBkb2VzIG5vdCBzZXQgbW91bnRfZGV2aWNlLCB3aGljaCBtYWtlcyBCUk9LOgo+ID4g
ICAgcHJlYWR2MjAzLmM6MTIyOiBCUk9LOiBwcmVhZHYyKCkgZmFpbGVkOiBFT1BOT1RTVVBQCj4g
PiAKPiA+IEZpeGluZyB0aGlzIGJ5IGZvcm1hdCBhbmQgbW91bnQgZGV2aWNlIGlmIGFsbF9maWxl
c3lzdGVtcyBpcyBzZXQgaW4gbGlicmFyeS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTXVycGh5
IFpob3U8eHpob3VAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gICBsaWIvdHN0X3Rlc3QuYyB8IDUg
KysrKy0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvbGliL3RzdF90ZXN0LmMgYi9saWIvdHN0X3Rlc3QuYwo+
ID4gaW5kZXggOTVmMzg5ZDJlLi42MWRiYTc5M2UgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvdHN0X3Rl
c3QuYwo+ID4gKysrIGIvbGliL3RzdF90ZXN0LmMKPiA+IEBAIC04MDgsOCArODA4LDExIEBAIHN0
YXRpYyB2b2lkIGRvX3NldHVwKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4gPiAgIAkJdHN0X3Rl
c3QtPmZvcm1hdF9kZXZpY2UgPSAxOwo+ID4gICAJfQo+ID4gCj4gPiAtCWlmICh0c3RfdGVzdC0+
YWxsX2ZpbGVzeXN0ZW1zKQo+ID4gKwlpZiAodHN0X3Rlc3QtPmFsbF9maWxlc3lzdGVtcykgewo+
ID4gICAJCXRzdF90ZXN0LT5uZWVkc19kZXZpY2UgPSAxOwo+ID4gKwkJdHN0X3Rlc3QtPm1vdW50
X2RldmljZSA9IDE7Cj4gPiArCQl0c3RfdGVzdC0+Zm9ybWF0X2RldmljZSA9IDE7Cj4gPiArCX0K
PiBIaSBNdXJwaCwKPiAKPiAxKSB0c3RfdGVzdC0+Zm9ybWF0X2RldmljZSB3aWxsIGJlIHNldCBh
dXRvbWF0aWNhbGx5IHdoZW4gd2Ugc2V0Cj4gdHN0X3Rlc3QtPm1vdW50X2RldmljZS4KClllcy4g
YnV0IG5lZWQgdG8gc2V0IG1vdW50X2RldmljZSBpbiB0aGUgdGNhc2UuCgo+IDIpIEl0J3MgdW5y
ZWFzb25hYmxlIHRvIHNldCB0c3RfdGVzdC0+bW91bnRfZGV2aWNlIGZvciBhbGwgZmlsZXN5c3Rl
bXMKPiBmb3JjZWx5IGJlY2F1c2Ugd2UKPiAgICBkb24ndCBuZWVkIHRvIG1vdW50IGZvciBhbGwg
ZmlsZXN5c3RlbXMgaW4gc29tZSBjYXNlcyhlLmcuIGp1c3QgdGVzdAo+IGZvcm1hdGluZykuCgpH
b29kIHBvaW50LgoKPiAKPiBQZXJoYXBzLCB5b3UganVzdCBhZGQgdHN0X3Rlc3QtPm1vdW50X2Rl
dmljZSBpbiBwcmVhZHYyMDMuYy4gOi0pCgpZZXMuLiBUaGF0J3MgSSBmb3JnZXQgdG8gc2F5IGlu
IHRoZSBjb21taXQgbWVzc2FnZS4gSSBqdXN0IHJlY2FsbGVkIHRoaXMgYW5kCnRoZW4gSSBzYXcg
eW91ciBlbWFpbCA6KQoKSGkgQ3lyaWwsIHdoYXQgZG8geW91IHRoaW5rPyBJJ20gZmluZSB3aXRo
IGVpdGhlciB3YXkuCgpUaGFua3MsCk11cnBoeQo+IAo+IEJlc3QgUmVnYXJkcywKPiBYaWFvIFlh
bmcKPiA+IAo+ID4gICAJc2V0dXBfaXBjKCk7Cj4gPiAKPiAKPiAKPiAKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
