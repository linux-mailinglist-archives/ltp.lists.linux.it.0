Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 108A310A0E
	for <lists+linux-ltp@lfdr.de>; Wed,  1 May 2019 17:30:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEDC13EA3E8
	for <lists+linux-ltp@lfdr.de>; Wed,  1 May 2019 17:30:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A29AD3EA389
 for <ltp@lists.linux.it>; Wed,  1 May 2019 17:30:08 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A7E51600551
 for <ltp@lists.linux.it>; Wed,  1 May 2019 17:30:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BEA5EADD4;
 Wed,  1 May 2019 15:30:05 +0000 (UTC)
Date: Wed, 1 May 2019 17:30:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20190501153003.GA19942@x230>
References: <20190429072800.23067-1-pvorel@suse.cz>
 <20190429072800.23067-2-pvorel@suse.cz>
 <946495a7-4f75-4cca-163d-9447818bf1c3@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <946495a7-4f75-4cca-163d-9447818bf1c3@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 2/2] net/tracepath: Rewrite into new API
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

SGkgQWxleGV5LAoKPiBPbiAyOS4wNC4yMDE5IDEwOjI4LCBQZXRyIFZvcmVsIHdyb3RlOgo+ID4g
ZW5oYW5jZW1lbnRzOgo+ID4gKiBDaGVjayBmb3IgdHJhY2VwYXRoIC02IHdoZW4gdHJhY2VwYXRo
NiBub3QgYXZhaWxhYmxlCj4gPiAgIHRyYWNlcGF0aDYgd2FzIHJlbW92ZWQgaW4gaXB1dGlscyBz
MjAxNjExMDUgYW5kIHJlcGxhY2VkIGJ5IHRyYWNlcGF0aCAtNiwKPiA+ICAgdGhpcyB3YXkgaXQn
cyBwb3J0YWJsZSBmb3IgYm90aCBhbGwgaXB1dGlscyByZWxlYXNlcwoKPiA+ICogUHJpbnQgdHJh
Y2VwYXRoIHZlcnNpb24gaWYgLVYgaXMgYXZhaWxhYmxlIChhZGRlZCBpbiBpbnB1dGlscyBzMjAx
OTAzMjQpCgo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Cj4g
PiAtLS0KPiA+ICAuLi4vbmV0d29yay90Y3BfY21kcy90cmFjZXBhdGgvdHJhY2VwYXRoMDEuc2gg
fCA2MCArKysrKysrKystLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlv
bnMoKyksIDMxIGRlbGV0aW9ucygtKQoKCj4gQWNrZWQtYnk6IEFsZXhleSBLb2RhbmV2IDxhbGV4
ZXkua29kYW5ldkBvcmFjbGUuY29tPgpUaGFua3MgZm9yIGEgcmV2aWV3LCBtZXJnZWQuCgpLaW5k
IHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
