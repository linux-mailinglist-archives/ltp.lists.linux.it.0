Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7536239B4F
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Jun 2019 07:46:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C410F3EB176
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Jun 2019 07:46:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 81E253EB18F
 for <ltp@lists.linux.it>; Sat,  8 Jun 2019 07:46:07 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3455D601AE7
 for <ltp@lists.linux.it>; Sat,  8 Jun 2019 07:45:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EB96AC01F28C
 for <ltp@lists.linux.it>; Sat,  8 Jun 2019 05:45:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-12-30.pek2.redhat.com
 [10.72.12.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 292F25D707
 for <ltp@lists.linux.it>; Sat,  8 Jun 2019 05:45:56 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sat,  8 Jun 2019 13:45:50 +0800
Message-Id: <20190608054550.13744-3-liwang@redhat.com>
In-Reply-To: <20190608054550.13744-1-liwang@redhat.com>
References: <20190608054550.13744-1-liwang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Sat, 08 Jun 2019 05:45:57 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH RFC 3/3] testcase: get rid of compiling errors
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

U2lnbmVkLW9mZi1ieTogTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+Ci0tLQogY29uZmlndXJl
LmFjICAgICAgICAgICAgIHwgMSArCiB0ZXN0Y2FzZXMvY3ZlL21lbHRkb3duLmMgfCA1ICsrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3Vy
ZS5hYyBiL2NvbmZpZ3VyZS5hYwppbmRleCA1YTNkYzViNjIuLjM5YjJkNmRhNyAxMDA2NDQKLS0t
IGEvY29uZmlndXJlLmFjCisrKyBiL2NvbmZpZ3VyZS5hYwpAQCAtNTgsNiArNTgsNyBAQCBBQ19D
SEVDS19IRUFERVJTKFsgXAogICAgIHN5cy9zaG0uaCBcCiAgICAgc3lzL3VzdGF0LmggXAogICAg
IHN5cy94YXR0ci5oIFwKKyAgICBlbW1pbnRyaW4uaCBcCiBdKQogCiBBQ19DSEVDS19GVU5DUyhb
IFwKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9jdmUvbWVsdGRvd24uYyBiL3Rlc3RjYXNlcy9jdmUv
bWVsdGRvd24uYwppbmRleCBkYTM1MjEzZWMuLmU2ZTkxMWZjYyAxMDA2NDQKLS0tIGEvdGVzdGNh
c2VzL2N2ZS9tZWx0ZG93bi5jCisrKyBiL3Rlc3RjYXNlcy9jdmUvbWVsdGRvd24uYwpAQCAtMjks
NiArMjksNyBAQAogI2luY2x1ZGUgPGN0eXBlLmg+CiAjaW5jbHVkZSA8c3lzL3V0c25hbWUuaD4K
IAorI2lmZGVmIEhBVkVfRU1NSU5UUklOX0gKICNpbmNsdWRlIDxlbW1pbnRyaW4uaD4KIAogI2lu
Y2x1ZGUgImxpYnRzYy5oIgpAQCAtMzg3LDMgKzM4OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rl
c3QgdGVzdCA9IHsKIAkuY2xlYW51cCA9IGNsZWFudXAsCiAJLm1pbl9rdmVyID0gIjIuNi4zMiIK
IH07CisKKyNlbHNlIC8qIEhBVkVfRU1NSU5UUklOX0ggKi8KKwlUU1RfVEVTVF9UQ09ORigiPGVt
bWludHJpbi5oPiBpcyBub3Qgc3VwcG9ydGVkIik7CisjZW5kaWYKLS0gCjIuMTcuMAoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
