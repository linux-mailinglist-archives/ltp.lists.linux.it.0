Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE34264805
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 16:32:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE04C3C2DC5
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 16:32:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 03D483C2C7C
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 15:57:19 +0200 (CEST)
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6FFBC1A0100A
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 15:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=ufBtsTI4pcrYQeT7wy
 D82o7SuPV6Udd0aziCWJ9bLCE=; b=i/fCKcUVBJnnuwaqQu+zer5DZm+TMZColM
 9QmDKqCG5av5+3MER5LKDq++TIJrf7bOozduryfBaGoHZCS3HfVfyGJISaHeeoeN
 ouludN05oiFOQt7lLd3KbL9cBvujdq79icekIAWEUsWSq++id+OXM0jf+v79wvOs
 5SnOONTpM=
Received: from bogon.localdomain (unknown [122.96.112.47])
 by smtp8 (Coremail) with SMTP id NORpCgCXik+PMFpfzXH6GQ--.4966S2;
 Thu, 10 Sep 2020 21:57:02 +0800 (CST)
From: Chen Hanxiao <chen_han_xiao@126.com>
To: ltp@lists.linux.it
Date: Thu, 10 Sep 2020 09:56:31 -0400
Message-Id: <1599746191-2012-1-git-send-email-chen_han_xiao@126.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: NORpCgCXik+PMFpfzXH6GQ--.4966S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr17GFyUXrW3tF18AF18Xwb_yoW5GrW7pF
 s8GFZxJ3yDWFy3Cw43ZF4rt34rGan3J3srWrZFy34a93yrXr10qFsF93W7J34YqrWSvw1D
 Za9Yga1rWFyUJFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U-yCXUUUUU=
X-Originating-IP: [122.96.112.47]
X-CM-SenderInfo: xfkh0spkdqs5xldrqiyswou0bp/1tbi4w6brlpD8B7Z0wAAsl
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 10 Sep 2020 16:31:59 +0200
Subject: [LTP] [PATCH] ns-tools/set_ipv4addr: Use ip command as default
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
Cc: Chen Hanxiao <chenhx.fnst@cn.fujitsu.com>, chen_han_xiao@126.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Chen Hanxiao <chenhx.fnst@cn.fujitsu.com>

Set iproute as the default as ifconfig
has been deprecated on some of the distributions.

Signed-off-by: Chen Hanxiao <chenhx.fnst@cn.fujitsu.com>
---
 testcases/network/stress/ns-tools/set_ipv4addr | 40 +++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/testcases/network/stress/ns-tools/set_ipv4addr b/testcases/network/stress/ns-tools/set_ipv4addr
index 1ec0769..baf5d4a 100644
--- a/testcases/network/stress/ns-tools/set_ipv4addr
+++ b/testcases/network/stress/ns-tools/set_ipv4addr
@@ -57,6 +57,8 @@ export LTPROOT
 # Check the environmanet variable for the test
 . check_envval || exit 1
 
+CMD="${CMD:-ip}"
+
 # Arguments
 if [ $# -ne 4 ]; then
     echo "Usage: $0 host_type link_num network_portion host_portion" >&2
@@ -77,17 +79,41 @@ fi
 addr=${network_part}.${host_part}
 netmask=`echo $network_part | sed "s/[[:digit:]]*/255/g"`.`echo $host_part | sed "s/[[:digit:]]*/0/g"`
 broadcast=${network_part}.`echo $host_part | sed "s/[[:digit:]]*/255/g"`
+prefix=0
+
+netmask_to_prefix()
+{
+    bits=0
+    for octet in $(echo $1| sed 's/\./ /g'); do
+        binbits=$(echo "obase=2; ibase=10; ${octet}"| bc | sed 's/0//g')
+        let bits+=${#binbits}
+    done
+    prefix=$bits
+}
+
+netmask_to_prefix $netmask
 
 # Assign IPv4 address to the interface belongs the link_num Test Link
 ifname=`get_ifname $host_type $link_num` || exit 1
 
-if [ $host_type = lhost ]; then
-    ifconfig $ifname up
-    ifconfig $ifname $addr netmask $netmask broadcast $broadcast
-    ret=$?
-else
-    ret=`$LTP_RSH $RHOST '( PATH=/sbin:/usr/sbin:$PATH ; ifconfig '$ifname' up && ifconfig '$ifname $addr' netmask '$netmask' broadcast '$broadcast' ) >/dev/null 2>&1; echo $?'`
-fi
+case $CMD in
+    ip)
+        if [ $host_type = lhost ]; then
+            ip link set $ifname up
+            ip address add $addr'/'$prefix dev $ifname broadcast $broadcast
+            ret=$?
+        else
+            ret=`$LTP_RSH $RHOST '( PATH=/sbin:/usr/sbin:$PATH ; ip link set '$ifname' up && ip address add '$addr'/'$prefix' dev '$ifname' broadcast '$broadcast' ) >/dev/null 2>&1; echo $?'`
+        fi ;;
+ifconfig)
+        if [ $host_type = lhost ]; then
+            ifconfig $ifname up
+            ifconfig $ifname $addr netmask $netmask broadcast $broadcast
+            ret=$?
+        else
+            ret=`$LTP_RSH $RHOST '( PATH=/sbin:/usr/sbin:$PATH ; ifconfig '$ifname' up && ifconfig '$ifname $addr' netmask '$netmask' broadcast '$broadcast' ) >/dev/null 2>&1; echo $?'`
+        fi ;;
+esac
 
 if [ $ret -gt 0 ]; then
     echo "Cannot set $addr to $ifname" >&2
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
