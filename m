Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 317DC1CF48
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 20:42:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C1FC3EA2BA
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 20:42:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E54263EA18B
 for <ltp@lists.linux.it>; Tue, 14 May 2019 20:42:08 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 03158600949
 for <ltp@lists.linux.it>; Tue, 14 May 2019 20:42:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 827AEABE7;
 Tue, 14 May 2019 18:42:06 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190405165225.27216-1-pvorel@suse.cz>
 <20190405165225.27216-4-pvorel@suse.cz>
From: Ignaz Forster <iforster@suse.de>
Message-ID: <810d4df7-1e5e-dd24-8b87-e0fa3edbd25f@suse.de>
Date: Tue, 14 May 2019 20:42:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190405165225.27216-4-pvorel@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: Fabian Vogt <FVogt@suse.com>, linux-integrity@vger.kernel.org,
 Marcus Meissner <meissner@suse.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: [LTP] [PATCH v2 3/3] ima: Add overlay test
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0ciwKCnRoYW5rcyBhIGxvdCBmb3IgeW91ciBjb250aW51ZWQgd29yayBvbiB0aGUgSU1B
IC8gRVZNIHRlc3RzIGFuZCBzb3JyeSAKZm9yIG1pc3NpbmcgZmVlZGJhY2sgLSB0aGUgbWFpbCBn
b3QgbG9zdCBpbiBteSBzdGFjayBvZiBUT0RPIGl0ZW1zLgoKQW0gMDUuMDQuMTkgdW0gMTg6NTIg
VWhyIHNjaHJpZWIgUGV0ciBWb3JlbDoKPiBTaG91bGQgSSBjaGVjayBFVk0gZW5hYmxlZD8KCkFz
IHRoZXNlIHRlc3RzIHJlcXVpcmUgYW4gYXBwcm9wcmlhdGVseSBwcmVwYXJlZCBtYWNoaW5lIGFu
eXdheTogSG93IAphYm91dCBwcmludGluZyBhIG1lc3NhZ2Ugd2hldGhlciBvbmx5IElNQSBvciBi
b3RoIElNQSBhbmQgRVZNIGFyZSAKZW5hYmxlZC4gVGhlc2UgdGVzdHMgbWFrZSBzZW5zZSBpbiBi
b3RoIGNhc2VzLCBzbyBJIHdvdWxkbid0IGJsb2NrIHRoZW0gCm9uIGVpdGhlciBzZXR1cC4KCj4g
L3N5cy9rZXJuZWwvc2VjdXJpdHkvZXZtIHNob3VsZCBiZSAxPwoKWWVzLCB0aGF0IHNob3VsZCBi
ZSBlbm91Z2ggdG8gZGV0ZWN0IHdoZXRoZXIgRVZNIGlzIGVuYWJsZWQuCgo+ICt0ZXN0MSgpCj4g
K3sKPiArCWxvY2FsIGZpbGU9ImZvbzEudHh0Igo+ICsKPiArCXRzdF9yZXMgVElORk8gIm92ZXJ3
cml0ZSBmaWxlIGluIG92ZXJsYXkiCj4gKwlST0QgZWNobyBsb3dlciBcPiAkbG93ZXIvJGZpbGUK
PiArCUVYUEVDVF9QQVNTIGVjaG8gb3ZlcmxheSBcPiAkbWVyZ2VkLyRmaWxlCgpJdCBzZWVtcyB0
aGUgcmVkaXJlY3Rpb24gLyBlc2NhcGluZyBpcyB3cm9uZyBoZXJlOiB0aGUgc3RyaW5nICJvdmVy
bGF5IiAKbmV2ZXIgZW5kcyB1cCBpbiB0aGUgdGFyZ2V0IGZpbGUuCgo+ICt9Cj4gKwo+ICt0ZXN0
MigpCj4gK3sKPiArCWxvY2FsIGZpbGU9ImZvbzIudHh0Igo+ICsKPiArCXRzdF9yZXMgVElORk8g
ImFwcGVuZCBmaWxlIGluIG92ZXJsYXkiCj4gKwlST0QgZWNobyBsb3dlciBcPiAkbG93ZXIvJGZp
bGUKPiArCUVYUEVDVF9QQVNTIGVjaG8gb3ZlcmxheSBcPlw+ICRtZXJnZWQvJGZpbGUKClNhbWUg
aGVyZTogIm92ZXJsYXkiIG5ldmVyIGVuZHMgdXAgaW4gdGhlIHRhcmdldCBmaWxlLgoKSWduYXoK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
