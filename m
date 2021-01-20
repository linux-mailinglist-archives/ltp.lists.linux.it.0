Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B67FF2FD2D6
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:38:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 328763C6605
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:38:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B37F93C6535
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:37:40 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7954A1400E67
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611153460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2j0XbK/1WjIdhU456gkB7ScjrGdsote0niueTWY6heM=;
 b=aajR17uSNHPtQmCvNzhtnlfi6AGrnOJo8Be8WOecBeh+KAeAMdT7QV1RKePB80iQo72Qd7
 ez6dme0WUqL45uwDo3p5qkpJggSsLwP9MWWu7hpv8d37pNBHWYdz4KnK+glLJbflERvZRJ
 mvTOfDrOW7E9JD3dk/1z+oSvmDR5Tlc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1CC0FAD8C;
 Wed, 20 Jan 2021 14:37:40 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 20 Jan 2021 14:37:23 +0000
Message-Id: <20210120143723.26483-8-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210120143723.26483-1-rpalethorpe@suse.com>
References: <20210120143723.26483-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 7/7] can: Update contact details
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Oliver Hartkopp <socketcan@hartkopp.net>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Richard Palethorpe <rpalethorpe@suse.com>, linux-can@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

socketcan-users appears to be no more.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/network/can/filter-tests/00_Descriptions.txt | 5 +++--
 testcases/network/can/filter-tests/Makefile            | 2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/testcases/network/can/filter-tests/00_Descriptions.txt b/testcases/network/can/filter-tests/00_Descriptions.txt
index 55d213456..9623d29a0 100644
--- a/testcases/network/can/filter-tests/00_Descriptions.txt
+++ b/testcases/network/can/filter-tests/00_Descriptions.txt
@@ -6,5 +6,6 @@ information on the CAN network protocol family PF_CAN is contained in
 
 For any issue(s) with CAN tests please write to:
 <ltp@lists.linux.it>
-<socketcan-users@lists.berlios.de>,
-Oliver Hartkopp <oliver.hartkopp@volkswagen.de>,
+Oliver Hartkopp <socketcan@hartkopp.net>
+Linux-CAN ML <linux-can@vger.kernel.org>
+
diff --git a/testcases/network/can/filter-tests/Makefile b/testcases/network/can/filter-tests/Makefile
index 29aaa3240..bd57c7fff 100644
--- a/testcases/network/can/filter-tests/Makefile
+++ b/testcases/network/can/filter-tests/Makefile
@@ -14,8 +14,6 @@
 #    You should have received a copy of the GNU General Public License along
 #    with this program; if not, write to the Free Software Foundation, Inc.,
 #    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-#  Send feedback to <socketcan-users@lists.berlios.de>
 
 top_srcdir		?= ../../../..
 
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
