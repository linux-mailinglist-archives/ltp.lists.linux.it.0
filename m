Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242830A4F
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 10:32:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB93C2987A2
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 10:32:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 58815298784
 for <ltp@lists.linux.it>; Fri, 31 May 2019 10:32:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1F06B1A01789
 for <ltp@lists.linux.it>; Fri, 31 May 2019 10:32:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 86A99AF1A;
 Fri, 31 May 2019 08:32:04 +0000 (UTC)
Date: Fri, 31 May 2019 10:32:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20190531083203.GA4224@rei.lan>
References: <CAMy_GT-kRs7_EZvrP-JdFc_wa8OMc3295N6FWUg7AxoY2O66fA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMy_GT-kRs7_EZvrP-JdFc_wa8OMc3295N6FWUg7AxoY2O66fA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] insmod01_sh test from commands test suite will make
 cve-2017-17053 test fail
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

SGkhCj4gV2UgZm91bmQgb3V0IHRoYXQgd2hlbiBydW5uaW5nIHRoZSBMVFAgdGVzdCBzdWl0ZSBk
aXJlY3RseSAod2hpY2ggdXNlcwo+IHRoZSAiZGVmYXVsdCIgZmlsZSBpbiBzY2VuYXJpb19ncm91
cHMpLiBUaGUgaW5zbW9kMDFfc2ggd2lsbCBpbnNlcnQgYW4KPiBvdXQtb2YtdHJlZSBtb2R1bGUg
YW5kIHRhaW50cyB0aGUga2VybmVsLCBhbmQgdGhlIGZvbGxvd2luZwo+IGN2ZS0yMDE3LTE3MDUz
IHRlc3QgaW4gdGhlIGN2ZSB0ZXN0IHN1aXRlIHdpbGwgY2hlY2sgaWYgdGhlIGtlcm5lbCBpcwo+
IHRhaW50ZWQuIFRodXMgY2F1c2luZyBzb21lIGZhbHNlLXBvc2l0aXZlIGluIHRoZSB0ZXN0IHJl
c3VsdC4KPiAKPiBQZXJoYXBzIGEgd29ya2Fyb3VuZCBpcyB0byBtb3ZlIHRoZSBjdmUgdGVzdCBz
dWl0ZSB0byBzb21ld2hlcmUgYmVmb3JlCj4gdGhlIGNvbW1hbmRzIHRlc3Qgc3VpdGUgaW4gdGhl
ICJkZWZhdWx0IiBzY2VuYXJpby4KPiAKPiBCdWdMaW5rOiBodHRwczovL2J1Z3MubGF1bmNocGFk
Lm5ldC9idWdzLzE4MzAwMTEKCkxvb2tpbmcgYXQgdGhlIGJ1ZyB0aGUgcHJvYmxlbSBpcyB0aGF0
IHRoZSBtb2R1bGUgaXMgbWlzc2luZyBsaWNlbnNlLgoKSSBndWVzcyB0aGF0IGFkZGluZyBNT0RV
TEVfTElDRU5TRSgiR1BMIik7IHRvIHRoZSBkdW1teSBtb2R1bGUKdGVzdGNhc2VzL2NvbW1hbmRz
L2luc21vZC9sdHBfaW5zbW9kMDEuYyBzaG91bGQgZml4IGl0LgoKLS0gCkN5cmlsIEhydWJpcwpj
aHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
