Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2C122457A
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 22:57:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B6BB3C4E94
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 22:57:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 410B53C13D8
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 22:57:32 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id F23C21000A5F
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 22:57:30 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1D91620B4909;
 Fri, 17 Jul 2020 13:57:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1D91620B4909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1595019448;
 bh=YilxP5vOtbx5gBob2b5+iU4I/Tge45zELskxmu3VXuw=;
 h=From:To:Cc:Subject:Date:From;
 b=YmMwfnInRdOI2B9p9reL+wxfioCroIR0ylqrQY+8Nn/1GgQRphcJ2sai1SjB1SG9b
 nmLowUWIaZv8TO3p7LRO8SMIMVSfjUFf6IV9VUedAPeX1taQ9Mx+Wr/BtN32MFWR9/
 f0KUTmeHhF0UJ31A4vzod8vFZvaINzW9ZDRQ/tGk=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: zohar@linux.ibm.com,
	pvorel@suse.cz,
	ltp@lists.linux.it
Date: Fri, 17 Jul 2020 16:57:21 -0400
Message-Id: <20200717205721.18173-1-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] IMA: Add a test to verify importing a certificate
 into custom keyring
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

A test for verifying importing an x509 certificate into a keyring and
validating the key measurement performed by IMA is needed.

Add an IMA measurement test that verifies that an x509 certificate
can be imported into a custom keyring and measured correctly.

A certificate used by the test is included in the `datafiles/keys` directory.

Using a custom keyring for the test is preferred over using a pre-existing/built-in keyring,
such as `.ima`, since there may be restrictions to importing any cert into a built-in keyring.
For example, the `.ima` keyring requires that the imported certs be signed by a kernel private
key in certain kernel configurations.

Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
---
 .../kernel/security/integrity/ima/README.md   |  20 +++-----
 .../security/integrity/ima/datafiles/Makefile |  11 ++---
 .../integrity/ima/datafiles/keys/Makefile     |  31 ++++++++++++
 .../integrity/ima/datafiles/keys/x509.der     | Bin 0 -> 784 bytes
 .../integrity/ima/datafiles/policy/Makefile   |  31 ++++++++++++
 .../datafiles/{ => policy}/keycheck.policy    |   0
 .../ima/datafiles/{ => policy}/measure.policy |   0
 .../{ => policy}/measure.policy-invalid       |   0
 .../security/integrity/ima/tests/ima_keys.sh  |  45 +++++++++++++++++-
 9 files changed, 117 insertions(+), 21 deletions(-)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/keys/Makefile
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/keys/x509.der
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/policy/Makefile
 rename testcases/kernel/security/integrity/ima/datafiles/{ => policy}/keycheck.policy (100%)
 rename testcases/kernel/security/integrity/ima/datafiles/{ => policy}/measure.policy (100%)
 rename testcases/kernel/security/integrity/ima/datafiles/{ => policy}/measure.policy-invalid (100%)

diff --git a/testcases/kernel/security/integrity/ima/README.md b/testcases/kernel/security/integrity/ima/README.md
index 732cd912f..db8819a99 100644
--- a/testcases/kernel/security/integrity/ima/README.md
+++ b/testcases/kernel/security/integrity/ima/README.md
@@ -16,25 +16,19 @@ space, may contain equivalent measurement tcb rules, detecting them would
 require `IMA_READ_POLICY=y` therefore ignore this option.
 
 ### IMA key import test
-`ima_keys.sh` requires a x509 public key, by default in `/etc/keys/x509_ima.der`
-(defined in `CONFIG_IMA_X509_PATH` kernel config option).
-The key must be signed by the private key you generate. Follow these instructions:
-https://manpages.ubuntu.com/manpages/disco/man1/evmctl.1.html#generate%20trusted%20keys
 
-The test cannot be set-up automatically because the x509 public key must be
-built into the kernel and loaded onto a trusted keyring
-(e.g. `.builtin_trusted_keys`, `.secondary_trusted_keyring`).
-
-As well as what's required for the IMA tests, the following are also required
+As well as what's required for the IMA tests, the following is also required
 in the kernel configuration:
 ```
 CONFIG_IMA_READ_POLICY=y
-CONFIG_IMA_X509_PATH="/etc/keys/x509_ima.der"
-CONFIG_SYSTEM_TRUSTED_KEYRING=y
-CONFIG_SYSTEM_TRUSTED_KEYS="/etc/keys/ima-local-ca.pem"
 ```
 
-Test also requires loaded policy with `func=KEY_CHECK`, see example in `keycheck.policy`.
+You must also add the following line to /etc/ima/ima-policy and reboot.
+```
+measure func=KEY_CHECK keyrings=key_import_test template=ima-buf
+```
+
+The test also requires loaded policy with `func=KEY_CHECK`, see example in `keycheck.policy`.
 
 ## EVM tests
 
diff --git a/testcases/kernel/security/integrity/ima/datafiles/Makefile b/testcases/kernel/security/integrity/ima/datafiles/Makefile
index a960f9d84..5261b9321 100644
--- a/testcases/kernel/security/integrity/ima/datafiles/Makefile
+++ b/testcases/kernel/security/integrity/ima/datafiles/Makefile
@@ -1,5 +1,5 @@
 #
-#    testcases/kernel/security/integrity/ima/policy testcases Makefile.
+#    kernel/security/integrity/ima testcase Makefile.
 #
 #    Copyright (C) 2009, Cisco Systems Inc.
 #
@@ -18,14 +18,13 @@
 #    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 #
 # Ngie Cooper, July 2009
+# Lachlan Sneff, July 2020
 #
 
 top_srcdir		?= ../../../../../..
 
-include	$(top_srcdir)/include/mk/env_pre.mk
+include $(top_srcdir)/include/mk/env_pre.mk
 
-INSTALL_DIR		:= testcases/data/ima_policy
+SUBDIRS			:= policy keys
 
-INSTALL_TARGETS		:= measure*
-
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
+include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/kernel/security/integrity/ima/datafiles/keys/Makefile b/testcases/kernel/security/integrity/ima/datafiles/keys/Makefile
new file mode 100644
index 000000000..3e381089c
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/datafiles/keys/Makefile
@@ -0,0 +1,31 @@
+#
+#    testcases/kernel/security/integrity/ima/policy testcases Makefile.
+#
+#    Copyright (C) 2009, Cisco Systems Inc.
+#
+#    This program is free software; you can redistribute it and/or modify
+#    it under the terms of the GNU General Public License as published by
+#    the Free Software Foundation; either version 2 of the License, or
+#    (at your option) any later version.
+#
+#    This program is distributed in the hope that it will be useful,
+#    but WITHOUT ANY WARRANTY; without even the implied warranty of
+#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#    GNU General Public License for more details.
+#
+#    You should have received a copy of the GNU General Public License along
+#    with this program; if not, write to the Free Software Foundation, Inc.,
+#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Lachlan Sneff, July 2020
+#
+
+top_srcdir		?= ../../../../../../..
+
+include	$(top_srcdir)/include/mk/env_pre.mk
+
+INSTALL_DIR		:= testcases/data/ima_keys
+
+INSTALL_TARGETS		:= x509.der
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/security/integrity/ima/datafiles/keys/x509.der b/testcases/kernel/security/integrity/ima/datafiles/keys/x509.der
new file mode 100644
index 0000000000000000000000000000000000000000..538611c7244eac17377031038a97bf5d02c53d3f
GIT binary patch
literal 784
zcmXqLV&*YuV*IjznTe5!Nkm*%!l+fPYOa%w{pGeOu7W)g|5Ocl**LY@JlekVGBR?r
zG8lv!@&kpKLs__Z*gSn5b)6jzH4M~10?a(}KmmQ%Fkgk_)S{Biw9Mqhl2nD_%=Em>
zymW=^)Jj7M12MR1oQz_e$%zh`xrw^Ti3W1wyha8Frbd>ArbZS<mQg^iArjXhz);YD
zA7U*>Mt*TgUSe*lp|pV{#A2cHjQqshOccB13}le);)f`4fN3^poR91^Mpg#q#$E=4
z#!jZjMuvqS<2&d4={o*uW**0h|9T%Tw9S&_xXFEO!9t#YW*25;x2$<5W-0eWw?OBy
z^v@jizdt`D%q<d|ReAl{bE_$0%^l11#6PRp?#-6J7PfX<qx=M^6KT?qw?*WN1?*@I
z%Cqp^b9sffLXO?miT~#3|NU~~-j<6EKTciX{lAO7bFKR(@pL9;Mh3>ku?EowJU|c1
z3NtePXJIm6FyIF9_*qz(nb;c)WI-H07BLo)gzIHKKP^@H&nbIpE!y9-E`Uo=(m)<0
zt;_-p@&=LZk_VQ~bi1@pYvM`%j}JQk-GBc`6502_h-GeKWMs(U%{uxsJ8V$|&s^U*
zuT)C?`L3+KeqYmBdG>)zfpWi7n6jqq>YI1K{O3*;XK_o1>WKamk9bck{$vuzdw37y
zvA`0c_d5A+eCHjLThIIJa@MIAVc(m-U;nXmbAi*F0<FyFA#2;;#Isxf2xngNvA$<=
z$CMi7RW8Ag|Jk3|uI6~;sc!ZA<5Qn=%P&bzdui}MisQ9MYhlhY|F7HrKV4$gX6yNt
zC8pkE<;LwsPD}g`oc<&~`(D3i*QEZk`);XW=B4u<{+H1Ux#t$eaj2M|C+nQUOz~ec
zU5)v!tl*ZMaObGw{B>uG+jphhdu=ZLZTh9(PmEsIm`5}$d$_dpOSj%iU{I%d0|3@i
BE~)?k

literal 0
HcmV?d00001

diff --git a/testcases/kernel/security/integrity/ima/datafiles/policy/Makefile b/testcases/kernel/security/integrity/ima/datafiles/policy/Makefile
new file mode 100644
index 000000000..692bf61ab
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/datafiles/policy/Makefile
@@ -0,0 +1,31 @@
+#
+#    testcases/kernel/security/integrity/ima/policy testcases Makefile.
+#
+#    Copyright (C) 2009, Cisco Systems Inc.
+#
+#    This program is free software; you can redistribute it and/or modify
+#    it under the terms of the GNU General Public License as published by
+#    the Free Software Foundation; either version 2 of the License, or
+#    (at your option) any later version.
+#
+#    This program is distributed in the hope that it will be useful,
+#    but WITHOUT ANY WARRANTY; without even the implied warranty of
+#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#    GNU General Public License for more details.
+#
+#    You should have received a copy of the GNU General Public License along
+#    with this program; if not, write to the Free Software Foundation, Inc.,
+#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Ngie Cooper, July 2009
+#
+
+top_srcdir		?= ../../../../../../..
+
+include	$(top_srcdir)/include/mk/env_pre.mk
+
+INSTALL_DIR		:= testcases/data/ima_policy
+
+INSTALL_TARGETS		:= measure*
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/security/integrity/ima/datafiles/keycheck.policy b/testcases/kernel/security/integrity/ima/datafiles/policy/keycheck.policy
similarity index 100%
rename from testcases/kernel/security/integrity/ima/datafiles/keycheck.policy
rename to testcases/kernel/security/integrity/ima/datafiles/policy/keycheck.policy
diff --git a/testcases/kernel/security/integrity/ima/datafiles/measure.policy b/testcases/kernel/security/integrity/ima/datafiles/policy/measure.policy
similarity index 100%
rename from testcases/kernel/security/integrity/ima/datafiles/measure.policy
rename to testcases/kernel/security/integrity/ima/datafiles/policy/measure.policy
diff --git a/testcases/kernel/security/integrity/ima/datafiles/measure.policy-invalid b/testcases/kernel/security/integrity/ima/datafiles/policy/measure.policy-invalid
similarity index 100%
rename from testcases/kernel/security/integrity/ima/datafiles/measure.policy-invalid
rename to testcases/kernel/security/integrity/ima/datafiles/policy/measure.policy-invalid
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index 904b7515b..101d2ea92 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -5,8 +5,8 @@
 #
 # Verify that keys are measured correctly based on policy.
 
-TST_NEEDS_CMDS="grep mktemp cut sed tr"
-TST_CNT=1
+TST_NEEDS_CMDS="grep mktemp cut sed tr xxd keyctl evmctl openssl cmp"
+TST_CNT=2
 TST_NEEDS_DEVICE=1
 
 . ima_setup.sh
@@ -65,4 +65,45 @@ test1()
 	tst_res TPASS "specified keyrings were measured correctly"
 }
 
+# Create a custom keyring and import a certficate to that
+test2() {
+	local custom_keyring_id temp_file="file.txt" \
+		cert_file="$TST_DATAROOT/x509.der"
+
+	tst_res TINFO "checking for correct IMA policy"
+
+	[ -f $IMA_POLICY ] || tst_brk TCONF "missing $IMA_POLICY"
+
+	[ -r $IMA_POLICY ] || tst_brk TCONF "cannot read IMA policy (CONFIG_IMA_READ_POLICY=y required)"
+
+	if ! grep "measure func=KEY_CHECK.*keyrings=.*key_import_test" $IMA_POLICY > /dev/null; then
+		tst_brk TCONF "the IMA policy does not include the key_import_test keyring. See the LTP IMA README."
+	fi
+
+	tst_res TINFO "creating a custom keyring (key_import_test keyring)"
+
+	custom_keyring_id=$(keyctl newring key_import_test @s) || \
+		tst_brk TCONF "unable to create a new keyring"
+
+	tst_is_num "$custom_keyring_id" || \
+		tst_brk TCONF "unable to parse custom keyring id"
+
+	evmctl import $cert_file "$custom_keyring_id" > /dev/null || \
+		tst_brk TCONF "unable to import a cert into the key_import_test keyring"
+
+	grep "key_import_test" "$ASCII_MEASUREMENTS" | tail -n1 | cut -d' ' -f6 | \
+		xxd -r -p > $temp_file || \
+		tst_brk TCONF "keyring not found in $ASCII_MEASUREMENTS"
+
+	if ! openssl x509 -in $temp_file -inform der > /dev/null; then
+		tst_brk TCONF "the cert logged in $ASCII_MEASUREMENTS is not a valid x509 certificate"
+	fi
+
+	if cmp -s $temp_file $cert_file; then
+		tst_res TPASS "logged cert matches original cert"
+	else
+		tst_res TFAIL "logged cert does not match original cert"
+	fi
+}
+
 tst_run
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
