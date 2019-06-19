Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 462EC4B2E8
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 09:14:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B8023EA8A4
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 09:14:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CDC5F3EA63C
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 09:14:10 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 324031A01066
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 09:14:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B07A13082E72
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 07:14:08 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E9BB183F0;
 Wed, 19 Jun 2019 07:14:07 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: jstancek@redhat.com
Date: Wed, 19 Jun 2019 15:14:01 +0800
Message-Id: <20190619071401.18509-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 19 Jun 2019 07:14:08 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: Ping Fang <pifang@redhat.com>, ltp@lists.linux.it
Subject: [LTP] [PATCH] lib: add include config.h in cloner.c
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

VGhpcyBpcyBhIGZvbGxvdyBmaXggZm9yIGNvbW1pdCBmNjE2NGZmYzI4MDRiMmE2ODIxOCwgb3Ro
ZXJ3aXNlIGNsb25lMDgKZmFpbGVkIHdpdGggRU5PU1lTIGVycm9yOgoKICAgIGNsb25lMDguYzo4
MTogSU5GTzogcnVubmluZyBDTE9ORV9QQVJFTlQKICAgIGNsb25lMDguYzoxMDQ6IEJST0s6IENM
T05FX1BBUkVOVCBjbG9uZSgpIGZhaWxlZDogRU5PU1lTCiAgICB0c3RfdGVzdC5jOjM1NzogQlJP
SzogUmVwb3J0ZWQgYnkgY2hpbGQgKDI3ODUpCgpUaGF0IGJlY3Vhc2UgQ0xPTkVfU1VQUE9SVFNf
N19BUkdTIG1hY3JvIGlzIGluY2x1ZGVkIGluIGNvbmZpZy5oLCB3aXRob3V0CnRoaXMgaGVhZGVy
IGZpbGUsIHRoZSBsdHBfY2xvbmU3KCkgd2lsbCBmYWxsIGludG8gRU5PU1lTIGJyYW5jaC4KClJl
cG9ydGVkLWJ5OiBQaW5nIEZhbmcgPHBpZmFuZ0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBM
aSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KLS0tCiBsaWIvY2xvbmVyLmMgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2xpYi9jbG9uZXIuYyBiL2xp
Yi9jbG9uZXIuYwppbmRleCA4NDY5NzQ1ZDAuLjExNDAxZjIzMCAxMDA2NDQKLS0tIGEvbGliL2Ns
b25lci5jCisrKyBiL2xpYi9jbG9uZXIuYwpAQCAtMjgsNiArMjgsNyBAQAogI2luY2x1ZGUgPHN0
ZGxpYi5oPgogI2luY2x1ZGUgPHNjaGVkLmg+CiAjaW5jbHVkZSA8c3RkYXJnLmg+CisjaW5jbHVk
ZSAiY29uZmlnLmgiCiAjaW5jbHVkZSAidHN0X2Nsb25lLmgiCiAKICN1bmRlZiBjbG9uZQkJCS8q
IHdlIHdhbnQgdG8gdXNlIGNsb25lKCkgKi8KLS0gCjIuMjAuMQoKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
