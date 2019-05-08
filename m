Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA317050
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 07:23:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5274F294AA8
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 07:23:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3CC323EADD0
 for <ltp@lists.linux.it>; Wed,  8 May 2019 07:23:27 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5CFF160141C
 for <ltp@lists.linux.it>; Wed,  8 May 2019 07:23:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E633888E5A;
 Wed,  8 May 2019 05:23:23 +0000 (UTC)
Received: from dhcp-12-157.nay.redhat.com (dhcp-12-157.nay.redhat.com
 [10.66.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBED5100200D;
 Wed,  8 May 2019 05:23:22 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: chrubis@suse.cz
Date: Wed,  8 May 2019 13:23:16 +0800
Message-Id: <20190508052318.9020-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 08 May 2019 05:23:24 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH 0/2] numa issue fixing for new ltp release
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

SGkgQ3lyaWwsCgpJIGhpdCB0aGlzIGlzc3VlcyBpbiB0aGUgbGF0ZXN0IExUUCB0ZXN0aW5nIG9u
IFJIRUw4IEdBLCBhbmQKSSB0aGluayB0aGV5IHByb2JhYmx5IHNob3VsZCBiZSBmaXhlZCBpbiB0
aGUgbmV3IGx0cCByZWxlYXNlCnBhY2thZ2UsIHNvIGNvdWxkIHlvdSB0YWtlIGEgbG9vaywgYW5k
IGNvbnNpZGVyIG1lcmdpbmc/CgpSZWdhcmRzLApMaSBXYW5nCgotLSAKMi4yMC4xCgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
