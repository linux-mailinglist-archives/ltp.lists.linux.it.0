Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE7729548
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 11:58:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E057E294AC9
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 11:58:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1165A3EA5F1
 for <ltp@lists.linux.it>; Fri, 24 May 2019 11:58:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9485E141CE74
 for <ltp@lists.linux.it>; Fri, 24 May 2019 11:58:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D1C97AE32;
 Fri, 24 May 2019 09:58:06 +0000 (UTC)
Date: Fri, 24 May 2019 11:58:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190524095806.GA19303@rei>
References: <20190524095317.10240-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524095317.10240-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] net: Disable building tst_get_unused_port in old
	API
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

SGkhCj4gQ29tbWl0IGZhNmE0ZTcwOCBtb3ZlZCB0c3RfZ2V0X3VudXNlZF9wb3J0IGludG8gbmV3
IEFQSSwgYnV0IGxlZnQgY29kZQo+IGluIE1ha2VmaWxlIGJ1aWx0IGl0IGFsc28gZm9yIG9sZCBB
UEkuIEl0IHdhcyB1cCB0byBtYWtlIHdoaWNoIG9mIHRoZXNlCj4gd2FzIGNvcGllZCBsYXN0IGFu
ZCByZW1haW4gaW5zdGFsbGVkLgo+IAo+IEFsc28gcmVtb3ZlIGNvbXBhcmlzb24gZm9yIHRzdF9n
ZXRfdW51c2VkX3BvcnQgZnJvbSBsdHBhcGljbWQuYy4KPiAKPiBGaXhlczogZmE2YTRlNzA4ICgi
bmV0OiBJbnRyb2R1Y2UgVFNUX0dFVF9VTlVTRURfUE9SVCgpIG1hY3JvIGludG8gQyBBUEkiKQoK
U29ycnkgZm9yIG5vdCBjYXRjaGluZyB0aGF0IGR1cmluZyByZXZpZXcsIHRoaXMgaXMgb2J2aW91
c2x5IGZpbmUsCmFja2VkLgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
