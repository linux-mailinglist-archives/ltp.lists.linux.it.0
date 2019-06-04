Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6290B342B7
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 11:09:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F4D13EAB0E
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 11:09:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9E4B93EAAFD
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 11:09:02 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0A62C1400744
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 11:09:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 10F55AC54
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 09:09:00 +0000 (UTC)
From: Petr Cervinka <pcervinka@suse.com>
To: ltp@lists.linux.it
Date: Tue,  4 Jun 2019 11:08:24 +0200
Message-Id: <20190604090824.15427-1-pcervinka@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Petr Cervinka <pcervinka@suse.com>
Subject: [LTP] [PATCH v2] Fix shebang in open-posix makefile generator
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

LS0tCiB0ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc2NyaXB0cy9nZW5lcmF0ZS1tYWtl
ZmlsZXMuc2ggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc2NyaXB0
cy9nZW5lcmF0ZS1tYWtlZmlsZXMuc2ggYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUv
c2NyaXB0cy9nZW5lcmF0ZS1tYWtlZmlsZXMuc2gKaW5kZXggNDY2NjczOWY1Li43YjExYzk4YmQg
MTAwNzU1Ci0tLSBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zY3JpcHRzL2dlbmVy
YXRlLW1ha2VmaWxlcy5zaAorKysgYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc2Ny
aXB0cy9nZW5lcmF0ZS1tYWtlZmlsZXMuc2gKQEAgLTE4Niw3ICsxODYsNyBAQCBFT0YKIAlpZiAh
IGdyZXAgLXEgJ15ydW4uc2gnICIkbWFrZWZpbGUuMyI7IHRoZW4KIAkJY2F0ID4+ICIkbWFrZWZp
bGUuMyIgPDxFT0YKIHJ1bi5zaDoKLQlAZWNobyAnIy9iaW4vc2gnID4gXCRACisJQGVjaG8gJyMh
L2Jpbi9zaCcgPiBcJEAKIAlAZWNobyAiXCQodG9wX3NyY2RpcikvYmluL3J1bi10ZXN0cy5zaCBc
JChzdWJkaXIpIFwkKElOU1RBTExfVEFSR0VUUykiID4+IFwkQAogCUBjaG1vZCAreCBydW4uc2gK
IAotLSAKMi4xNi40CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
