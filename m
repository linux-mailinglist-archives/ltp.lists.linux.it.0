Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 29651FBE4
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 16:51:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB5263EACD0
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 16:51:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 687FC3EA0CD
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 16:51:26 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B427D6019BF
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 16:51:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BD1EA309E972;
 Tue, 30 Apr 2019 14:51:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2BAF7C82B;
 Tue, 30 Apr 2019 14:51:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A620618089CB;
 Tue, 30 Apr 2019 14:51:23 +0000 (UTC)
Date: Tue, 30 Apr 2019 10:51:20 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <279785141.20224513.1556635880484.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190430144346.GA16914@dell5510>
References: <20190430144346.GA16914@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.23]
Thread-Topic: TST_BRK_SUPPORTS_ONLY_TCONF_TBROK() error message
Thread-Index: QA99vwlzxBeyOUyc3lFEgrXpsTR8TA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 30 Apr 2019 14:51:23 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] TST_BRK_SUPPORTS_ONLY_TCONF_TBROK() error message
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gSGkgSmFuLAo+IAo+IHlvdXIgY29tbWl0
IDA3MzhlMzc1MyAoImxpYjogYnVpbGQgY2hlY2sgcGFyYW1ldGVycyBmb3IgdHN0X2JyaygpIikg
YWRkZWQKPiBjaGVjawo+IGZvciBpbnZhbGlkIHR5cGVzLiBJIGd1ZXNzIHdlIGRpZG4ndCBmaW5k
IGEgd2F5IGhvdyB0byBwcmludCBtZWFuaW5nZnVsIGVycm9yCgpDb3JyZWN0IC0gYXQgbGVhc3Qg
bm90IHNvbWV0aGluZyB0aGF0IHdvdWxkIHdvcmsgZWFzaWx5IGFjcm9zcyBhbGwKY29tcGlsZXJz
IHR5cGVzL3ZlcnNpb25zLgoKPiBtZXNzYWdlIGUuZy4gInRzdF9icmsoKTogaW52YWxpZCB0eXBl
LCBwbGVhc2UgdXNlIFRCUk9LL1RDT05GL1RGQUlMIiBhcyBYaWFvCj4gc3VnZ2VzdGVkIFsxXS4g
QmVjYXVzZSBlcnJvciBtZXNzYWdlIG9uIHRzdF9icmsoVElORk8sICJmb28iKSBpcyBhIGJpdAo+
IGNvbmZ1c2luZzoKPiAKPiAuLi8uLi8uLi8uLi9pbmNsdWRlL3RzdF9jb21tb24uaDo2OToyNTog
ZXJyb3I6IHNpemUgb2YgdW5uYW1lZCBhcnJheSBpcwo+IG5lZ2F0aXZlCj4gICBkbyB7ICgodm9p
ZClzaXplb2YoY2hhclsxIC0gMiAqICEhKGNvbmRpdGlvbildKSk7IH0gd2hpbGUgKDApCj4gCj4g
KHRoaXMgaXMgbm90IHJlbGF0ZWQgdG8gY3VycmVudCByZWxlYXNlIGVmZm9ydCkKPiAKPiBLaW5k
IHJlZ2FyZHMsCj4gUGV0cgo+IAo+IFsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL2Nv
bW1lbnQvMjAyNjM3OC8KPiAKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
