Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 758E4214CF
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 09:51:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51DE03EA52A
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 09:51:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CF95C3EA2FF
 for <ltp@lists.linux.it>; Fri, 17 May 2019 09:51:01 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3DE656026E6
 for <ltp@lists.linux.it>; Fri, 17 May 2019 09:50:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7BADDAF59;
 Fri, 17 May 2019 07:50:59 +0000 (UTC)
Date: Fri, 17 May 2019 09:50:58 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20190517075057.GA12489@dell5510>
References: <20190405165225.27216-1-pvorel@suse.cz>
 <20190514121213.GA28655@dell5510>
 <1557889279.4581.14.camel@linux.ibm.com>
 <20190515120853.GA22992@dell5510>
 <1558044649.4507.10.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558044649.4507.10.camel@linux.ibm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: Ignaz Forster <iforster@suse.de>, linux-integrity@vger.kernel.org,
 Marcus Meissner <meissner@suse.com>, ltp@lists.linux.it,
 Fabian Vogt <FVogt@suse.com>
Subject: Re: [LTP] [PATCH v2 0/3] LTP reproducer on broken IMA on overlayfs
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

SGkgTWltaSwKCj4gPiBCdXQgd2hhdCBpcyBzdHJhbmdlIHRvIG1lIGlzIHRoYXQgaXQgY29udGlu
dWVzIHRvIGV4ZWN1dGUgc2Vjb25kIGxpbmUuIHJldHVybiAxIFsyXQo+ID4gc2hvdWxkIGNhdXNl
IFJPRCgpIHRvIHF1aXQgd2l0aCBUQlJPSyBbM10uCj4gPiBNYXliZSB0aGF0IFJPRCBpbiB0ZXN0
MSgpIHNob3VsZCBiZSByZXBsYWNlZCBFWFBFQ1RfUEFTUy4KCj4gV2l0aCBqdXN0IHRoZSBmaXJz
dCBwYXRjaCBvZiBJZ25heidzIHBhdGggc2V0IFsxXSBhbmQgdGhlIFRQTSAyLjAgdGVzdAo+IFsy
XSwgdGhlcmUgYXJlbid0IGFueSBlcnJvcnMuIMKgV2l0aG91dCBbMV0sIGl0J3Mgbm93IGZhaWxp
bmcgd2l0aCB0aGUKPiBjb3JyZWN0IG5hbWUuIMKgSSdtIG5vdyBzZWVpbmc6CkkgZ3Vlc3MsIHRo
YXQganVzdGlmaWVzIFsxXSB0byBiZSBtZXJnZWQgaW50byBrZXJuZWwuCgo+IGV2bV9vdmVybGF5
IDEgVElORk86ICRUTVBESVIgaXMgb24gdG1wZnMgPT4gcnVuIG9uIGxvb3AgZGV2aWNlCj4gZXZt
X292ZXJsYXkgMSBUSU5GTzogRm9ybWF0dGluZyAvZGV2L2xvb3AwIHdpdGggZXh0MyBleHRyYSBv
cHRzPScnCj4gZXZtX292ZXJsYXkgMSBUSU5GTzogb3ZlcndyaXRlIGZpbGUgaW4gb3ZlcmxheQo+
IHRzdF9yb2Q6IEZhaWxlZCB0byBvcGVuICdtbnRwb2ludC9tZXJnZWQvZm9vMS50eHQnIGZvciB3
cml0aW5nOiBQZXJtaXNzaW9uIGRlbmllZAo+IGV2bV9vdmVybGF5IDEgVEZBSUw6IGVjaG8gb3Zl
cmxheSA+IG1udHBvaW50L21lcmdlZC9mb28xLnR4dCBmYWlsZWQgdW5leHBlY3RlZGx5ClRoYXQg
c3RpbGwgZG9lcyBub3QgZXhwbGFpbiwgd2h5IHRlc3QgZG9lc24ndCBleGl0IGJlZm9yZSB0aGlz
IGxhc3QgbGluZS4KSSdsbCBoYXZlIGEgY2xvc2VyIGxvb2sgaW50byBpdC4gQnV0IGFzIEkgd3Jv
dGUsIEknbGwgbWFrZSB0aGVzZSBjaGFuZ2VzOgoKZGlmZiAtLWdpdCB0ZXN0Y2FzZXMva2VybmVs
L3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvZXZtX292ZXJsYXkuc2ggdGVzdGNhc2VzL2tl
cm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2V2bV9vdmVybGF5LnNoCmluZGV4IDA4
ZWMxZWEzNy4uMWQwNWI5ZTFjIDEwMDc1NQotLS0gdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9p
bnRlZ3JpdHkvaW1hL3Rlc3RzL2V2bV9vdmVybGF5LnNoCisrKyB0ZXN0Y2FzZXMva2VybmVsL3Nl
Y3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvZXZtX292ZXJsYXkuc2gKQEAgLTQwLDcgKzQwLDcg
QEAgdGVzdDEoKQogCWxvY2FsIGZpbGU9ImZvbzEudHh0IgogCiAJdHN0X3JlcyBUSU5GTyAib3Zl
cndyaXRlIGZpbGUgaW4gb3ZlcmxheSIKLQlST0QgZWNobyBsb3dlciBcPiAkbG93ZXIvJGZpbGUK
KwlFWFBFQ1RfUEFTUyBlY2hvIGxvd2VyIFw+ICRsb3dlci8kZmlsZQogCUVYUEVDVF9QQVNTIGVj
aG8gb3ZlcmxheSBcPiAkbWVyZ2VkLyRmaWxlCiB9CiAKQEAgLTQ5LDcgKzQ5LDcgQEAgdGVzdDIo
KQogCWxvY2FsIGZpbGU9ImZvbzIudHh0IgogCiAJdHN0X3JlcyBUSU5GTyAiYXBwZW5kIGZpbGUg
aW4gb3ZlcmxheSIKLQlST0QgZWNobyBsb3dlciBcPiAkbG93ZXIvJGZpbGUKKwlFWFBFQ1RfUEFT
UyBlY2hvIGxvd2VyIFw+ICRsb3dlci8kZmlsZQogCUVYUEVDVF9QQVNTIGVjaG8gb3ZlcmxheSBc
Plw+ICRtZXJnZWQvJGZpbGUKIH0KIAotLS0KSWYgaXQncyBvayBmb3IgeW91IGFuZCBpdCdzIGEg
dmFsaWQgdGVzdCBkbyB5b3UgZ2l2ZSBhbiBhY2s/CgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gTWlt
aQoKPiBbMV0gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtaW50ZWdyaXR5L21z
ZzA1OTI2Lmh0bWwKPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW50ZWdyaXR5
LzE1NTgwNDExNjIuMzk3MS4yLmNhbWVsQGxpbnV4LmlibS5jb20vVC8jdQoKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
