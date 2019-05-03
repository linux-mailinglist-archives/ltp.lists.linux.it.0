Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F8E1349A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 May 2019 23:00:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A0F03EACD4
	for <lists+linux-ltp@lfdr.de>; Fri,  3 May 2019 23:00:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 638DC3EA35F
 for <ltp@lists.linux.it>; Fri,  3 May 2019 23:00:10 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6F7012009DC
 for <ltp@lists.linux.it>; Fri,  3 May 2019 23:00:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 824B3AFE7;
 Fri,  3 May 2019 21:00:07 +0000 (UTC)
Date: Fri, 3 May 2019 23:00:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190503210005.GA18171@x230>
References: <20190430043957.479-1-xzhou@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430043957.479-1-xzhou@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] OVL_MNT: put overlayfs lower, upper, work,
 mnt dir in separated mountpoint
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpBY2tlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Cgo+ICB0ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2lub3RpZnkvaW5vdGlmeTA3LmMgfCAyNCArKysrKysrKysrKy0tLS0t
LQoKPiAtI2RlZmluZSBPVkxfTU5UICJvdmwiCj4gKyNkZWZpbmUgTU5UUE9JTlQJIm1udHBvaW50
Igo+ICsjZGVmaW5lIE9WTF9MT1dFUglNTlRQT0lOVCIvbG93ZXIiCj4gKyNkZWZpbmUgT1ZMX1VQ
UEVSCU1OVFBPSU5UIi91cHBlciIKPiArI2RlZmluZSBPVkxfV09SSwlNTlRQT0lOVCIvd29yayIK
PiArI2RlZmluZSBPVkxfTU5UCQlNTlRQT0lOVCIvb3ZsIgo+ICsKPiAgI2RlZmluZSBURVNUX0FQ
UCAiZXhlY3ZlYXRfY2hpbGQiCj4gICNkZWZpbmUgVEVTVF9GSUxFX1BBVEggT1ZMX01OVCIvIlRF
U1RfQVBQCgo+ICtzdGF0aWMgY29uc3QgY2hhciBtbnRwb2ludFtdID0gTU5UUE9JTlQ7Cj4gKwo+
ICBzdGF0aWMgaW50IG92bF9tb3VudGVkOwoKPiAgc3RhdGljIHZvaWQgZG9fY2hpbGQodm9pZCkK
PiBAQCAtOTEsMTIgKzk4LDEyIEBAIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gIAljaGVja19l
eGVjdmVhdCgpOwoKPiAgCS8qIFNldHVwIGFuIG92ZXJsYXkgbW91bnQgd2l0aCBsb3dlciBmaWxl
ICovCj4gLQlTQUZFX01LRElSKCJsb3dlciIsIDA3NTUpOwo+IC0JU0FGRV9NS0RJUigidXBwZXIi
LCAwNzU1KTsKPiAtCVNBRkVfTUtESVIoIndvcmsiLCAwNzU1KTsKPiArCVNBRkVfTUtESVIoT1ZM
X0xPV0VSLCAwNzU1KTsKPiArCVNBRkVfTUtESVIoT1ZMX1VQUEVSLCAwNzU1KTsKPiArCVNBRkVf
TUtESVIoT1ZMX1dPUkssIDA3NTUpOwo+ICAJU0FGRV9NS0RJUihPVkxfTU5ULCAwNzU1KTsKTk9U
RTogTWF5YmUgaXQnZCBiZSB3b3J0aCBvZiBhZGRpbmcgc29tZSBoZWxwZXIgdG8gZGVmaW5lIHRo
ZXNlIGNvbnN0YW50cyBhbmQgY3JlYXRpbmcgdGhpcyBzZXR1cCAoaW4gc2VwYXJhdGUgY29tbWl0
KS4KCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
