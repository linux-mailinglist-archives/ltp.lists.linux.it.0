Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 817A03891E
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 13:35:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52E8B3EA6F1
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 13:35:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C375B3EA5B7
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 13:35:40 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BD3601400E09
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 13:35:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D49E7AE13
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 11:35:38 +0000 (UTC)
Date: Fri, 7 Jun 2019 13:35:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190607113537.GA13869@rei.lan>
References: <20190604072228.17513-1-camann@suse.com>
 <20190606121436.GB27083@rei>
 <7c7bf785-adbd-d69b-c17b-bc65c2228d11@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c7bf785-adbd-d69b-c17b-bc65c2228d11@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/acct02: add functional testcase
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

SGkhCj4geWVzLCBJIGhhdmUgdGVzdGVkIGl0IG9uIGEgc3lzdGVtIGxpa2UgeW91IGRlc2NyaWJl
IGJ1dCBJIHJlY2VpdmUgYQo+IHBvc2l0aXZlIG91dHB1dDoKPiAKPiB0c3Rfa2NvbmZpZy5jOjYy
OiBJTkZPOiBQYXJzaW5nIGtlcm5lbCBjb25maWcgJy9wcm9jL2NvbmZpZy5neicKPiB0c3RfdGVz
dC5jOjExMTE6IElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAwaCAwNW0gMDBzCj4gdHN0X2tjb25m
aWcuYzo2MjogSU5GTzogUGFyc2luZyBrZXJuZWwgY29uZmlnICcvcHJvYy9jb25maWcuZ3onCj4g
YWNjdDAyLmM6MTU5OiBJTkZPOiBWZXJpZnlpbmcgdXNpbmcgJ3N0cnVjdCBhY2N0Jwo+IGFjY3Qw
Mi5jOjEzNzogSU5GTzogTnVtYmVyIG9mIGFjY291bnRpbmcgZmlsZSBlbnRyaWVzIHRlc3RlZDog
MQo+IGFjY3QwMi5jOjE0MDogUEFTUzogYWNjdCgpIHdyb3RlIGNvcnJlY3QgZmlsZSBjb250ZW50
cyEKPiAKPiBUaGVyZSBzZWVtcyB0byBiZSBzb21ldGhpbmcgZWxzZSBnb2luZyB3cm9uZy4gSSB3
aWxsIGludmVzdGlnYXRlIHRoaXMuCgpNYXkgYmUgc29tZXRoaW5nIHdyb25nIGF0IG15IGVuZCBh
cyB3ZWxsLCB3aGF0IGtlcm5lbCB2ZXJzaW9ucyBoYXZlIHlvdQp0ZXN0ZWQ/IEF0IG15IGVuZCBJ
IHRlc3RlZCA0LjIwLgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
