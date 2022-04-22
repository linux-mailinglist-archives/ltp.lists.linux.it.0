Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C6D50BA60
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Apr 2022 16:42:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5373D3CA711
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Apr 2022 16:42:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 763E13CA6F5
 for <ltp@lists.linux.it>; Fri, 22 Apr 2022 16:41:48 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 49F252009D4
 for <ltp@lists.linux.it>; Fri, 22 Apr 2022 16:41:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F275210F3;
 Fri, 22 Apr 2022 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650638506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9xgqHf94itxwvmQIeNTKPyibXJu02ZRG+hZXfVT4rBI=;
 b=2orgRndLl01/vIQmcu80CIFRnS6MMnqD6ftGJpPf/lQ3vhqMCMd1CmTYPxczzeCK8xHaj6
 7pELZ+u/MIbZn4Pp8XomsozSeQBVJqvdjj3zFSU1mK/wvpYY9vIJ1AZfUI6I5Nlwu4MY+N
 HAKp4c13t3aFLVGngzTZxl/QotD01ss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650638506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9xgqHf94itxwvmQIeNTKPyibXJu02ZRG+hZXfVT4rBI=;
 b=/DsrGaXUi61a74KHbsXe6WUlNnnNuc7i+orGQhDs7msb/WdoUohJD2/MSULMewQW4imDk0
 rxyNZjSjaRD6aOCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE77F13AE1;
 Fri, 22 Apr 2022 14:41:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6RbtJam+YmKUCwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 22 Apr 2022 14:41:45 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 22 Apr 2022 16:41:37 +0200
Message-Id: <20220422144141.16848-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/4] shell: Cleanup getopts usage
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
Cc: Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Changes v1->v2:
* new commits:
  shell: Use conditional expansion for library setup/cleanup
  doc: Update library API doc

* tst_test.sh: Cleanup getopts usage
	* Fix zram01.sh TST_SETUP redefinition
	* Fix tst_net.sh for shell API test
	* Fix dnsmasq_tests.sh (calling tst_selinux_enforced must be after
	  loaded script)
	* Style cleanup in if-lib.sh ipsec_lib.sh

* doc: Update shell API examples
	* Updates related to 1st and 2nd commit.

Petr Vorel (4):
  shell: Use conditional expansion for library setup/cleanup
  doc: Update library API doc
  tst_test.sh: Cleanup getopts usage
  doc: Update shell API examples

 doc/library-api-writing-guidelines.txt        | 23 +++++++
 doc/shell-test-api.txt                        |  8 +++
 lib/newlib_tests/shell/net/tst_ipaddr_un.sh   |  2 +-
 lib/newlib_tests/shell/net/tst_rhost_run.sh   |  2 +-
 lib/newlib_tests/shell/timeout01.sh           |  2 +-
 lib/newlib_tests/shell/timeout02.sh           |  2 +-
 lib/newlib_tests/shell/timeout03.sh           |  2 +-
 lib/newlib_tests/shell/timeout04.sh           |  2 +-
 lib/newlib_tests/shell/tst_check_driver.sh    |  2 +-
 lib/newlib_tests/shell/tst_check_kconfig01.sh |  3 +-
 lib/newlib_tests/shell/tst_check_kconfig02.sh |  2 +-
 lib/newlib_tests/shell/tst_check_kconfig03.sh |  2 +-
 lib/newlib_tests/shell/tst_check_kconfig04.sh |  2 +-
 lib/newlib_tests/shell/tst_check_kconfig05.sh |  2 +-
 lib/newlib_tests/shell/tst_format_device.sh   |  2 +-
 testcases/commands/ar/ar01.sh                 |  3 +-
 testcases/commands/cp/cp_tests.sh             |  2 +-
 testcases/commands/cpio/cpio_tests.sh         |  3 +-
 testcases/commands/df/df01.sh                 |  2 +-
 testcases/commands/du/du01.sh                 |  2 +-
 testcases/commands/eject/eject-tests.sh       |  2 +-
 testcases/commands/file/file01.sh             |  3 +-
 testcases/commands/gdb/gdb01.sh               |  3 +-
 testcases/commands/gzip/gzip_tests.sh         |  2 +-
 testcases/commands/insmod/insmod01.sh         |  2 +-
 testcases/commands/keyctl/keyctl01.sh         |  2 +-
 testcases/commands/ld/ld01.sh                 |  2 +-
 testcases/commands/ldd/ldd01.sh               |  2 +-
 testcases/commands/ln/ln_tests.sh             |  2 +-
 testcases/commands/lsmod/lsmod01.sh           |  2 +-
 testcases/commands/mkdir/mkdir_tests.sh       |  2 +-
 testcases/commands/mkfs/mkfs01.sh             |  2 +-
 testcases/commands/mkswap/mkswap01.sh         |  2 +-
 testcases/commands/mv/mv_tests.sh             |  2 +-
 testcases/commands/nm/nm01.sh                 |  2 +-
 testcases/commands/shell/shell_pipe01.sh      |  3 +-
 testcases/commands/sysctl/sysctl01.sh         |  3 +-
 testcases/commands/sysctl/sysctl02.sh         |  4 +-
 testcases/commands/tar/tar_tests.sh           |  3 +-
 testcases/commands/unshare/unshare01.sh       |  2 +-
 testcases/commands/unzip/unzip01.sh           |  2 +-
 testcases/commands/vmcp/vmcp_m.sh             |  3 +-
 testcases/commands/wc/wc01.sh                 |  2 +-
 testcases/commands/which/which01.sh           |  2 +-
 testcases/kernel/connectors/pec/cn_pec.sh     |  3 +-
 .../kernel/containers/netns/netns_breakns.sh  | 11 ++--
 .../kernel/containers/netns/netns_comm.sh     | 11 ++--
 .../kernel/containers/netns/netns_helper.sh   |  3 +-
 .../kernel/containers/netns/netns_sysfs.sh    |  3 +-
 .../cgroup/cgroup_regression_test.sh          |  5 +-
 testcases/kernel/controllers/cgroup_lib.sh    |  6 +-
 .../kernel/controllers/cpuacct/cpuacct.sh     |  3 +-
 .../cpuset/cpuset_regression_test.sh          |  4 +-
 .../memcg/functional/memcg_failcnt.sh         |  2 +-
 .../memcg/functional/memcg_force_empty.sh     |  2 +-
 .../controllers/memcg/functional/memcg_lib.sh | 64 +++++++++----------
 .../memcg/functional/memcg_limit_in_bytes.sh  |  2 +-
 .../memcg_max_usage_in_bytes_test.sh          |  2 +-
 .../memcg_memsw_limit_in_bytes_test.sh        |  2 +-
 .../memcg_move_charge_at_immigrate_test.sh    |  2 +-
 .../memcg/functional/memcg_stat_rss.sh        |  2 +-
 .../memcg/functional/memcg_stat_test.sh       |  2 +-
 .../memcg/functional/memcg_subgroup_charge.sh |  2 +-
 .../functional/memcg_usage_in_bytes_test.sh   |  2 +-
 .../functional/memcg_use_hierarchy_test.sh    |  2 +-
 .../memcg/stress/memcg_stress_test.sh         |  5 +-
 testcases/kernel/controllers/pids/pids.sh     |  3 +-
 .../kernel/device-drivers/rcu/rcu_torture.sh  |  3 +-
 .../kernel/device-drivers/zram/zram01.sh      |  5 +-
 .../kernel/device-drivers/zram/zram02.sh      |  2 +-
 .../kernel/device-drivers/zram/zram_lib.sh    |  9 +--
 .../kernel/fs/binfmt_misc/binfmt_misc01.sh    |  2 +-
 .../kernel/fs/binfmt_misc/binfmt_misc02.sh    |  2 +-
 .../kernel/fs/binfmt_misc/binfmt_misc_lib.sh  |  8 +--
 testcases/kernel/fs/fs_bind/bind/fs_bind01.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind02.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind03.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind04.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind05.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind06.sh |  2 +-
 .../kernel/fs/fs_bind/bind/fs_bind07-2.sh     |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind07.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind08.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind09.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind10.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind11.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind12.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind13.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind14.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind15.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind16.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind17.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind18.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind19.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind20.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind21.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind22.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind23.sh |  2 +-
 testcases/kernel/fs/fs_bind/bind/fs_bind24.sh |  2 +-
 .../fs/fs_bind/cloneNS/fs_bind_cloneNS01.sh   |  2 +-
 .../fs/fs_bind/cloneNS/fs_bind_cloneNS02.sh   |  2 +-
 .../fs/fs_bind/cloneNS/fs_bind_cloneNS03.sh   |  2 +-
 .../fs/fs_bind/cloneNS/fs_bind_cloneNS04.sh   |  2 +-
 .../fs/fs_bind/cloneNS/fs_bind_cloneNS05.sh   |  2 +-
 .../fs/fs_bind/cloneNS/fs_bind_cloneNS06.sh   |  2 +-
 .../fs/fs_bind/cloneNS/fs_bind_cloneNS07.sh   |  2 +-
 testcases/kernel/fs/fs_bind/fs_bind_lib.sh    | 11 ++--
 .../kernel/fs/fs_bind/fs_bind_regression.sh   |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move01.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move02.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move03.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move04.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move05.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move06.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move07.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move08.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move09.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move10.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move11.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move12.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move13.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move14.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move15.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move16.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move17.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move18.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move19.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move20.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move21.sh  |  2 +-
 .../kernel/fs/fs_bind/move/fs_bind_move22.sh  |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind01.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind02.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind03.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind04.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind05.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind06.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind07-2.sh     |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind07.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind08.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind09.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind10.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind11.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind12.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind13.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind14.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind15.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind16.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind17.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind18.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind19.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind20.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind21.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind22.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind23.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind24.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind25.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind26.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind27.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind28.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind29.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind30.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind31.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind32.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind33.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind34.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind35.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind36.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind37.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind38.sh       |  2 +-
 .../fs/fs_bind/rbind/fs_bind_rbind39.sh       |  2 +-
 testcases/kernel/fs/iso9660/isofs.sh          |  3 +-
 testcases/kernel/fs/linktest/linktest.sh      |  3 +-
 .../fs/quota_remount/quota_remount_test01.sh  |  3 +-
 testcases/kernel/mem/vma/vma05.sh             |  3 +-
 testcases/kernel/numa/numa01.sh               |  3 +-
 .../integrity/ima/tests/evm_overlay.sh        |  2 +-
 .../integrity/ima/tests/ima_conditionals.sh   |  3 +-
 .../security/integrity/ima/tests/ima_kexec.sh |  3 +-
 .../security/integrity/ima/tests/ima_keys.sh  |  4 +-
 .../integrity/ima/tests/ima_measurements.sh   |  3 +-
 .../integrity/ima/tests/ima_policy.sh         |  3 +-
 .../integrity/ima/tests/ima_selinux.sh        |  3 +-
 .../security/integrity/ima/tests/ima_setup.sh |  4 +-
 .../security/integrity/ima/tests/ima_tpm.sh   |  3 +-
 .../integrity/ima/tests/ima_violations.sh     |  5 +-
 .../tracing/dynamic_debug/dynamic_debug01.sh  |  5 +-
 testcases/lib/tst_net.sh                      |  5 +-
 testcases/lib/tst_test.sh                     | 29 ++++-----
 testcases/misc/lvm/cleanup_lvm.sh             |  2 +-
 testcases/misc/lvm/generate_lvm_runfile.sh    |  2 +-
 testcases/misc/lvm/prepare_lvm.sh             |  2 +-
 testcases/network/busy_poll/busy_poll01.sh    |  3 +-
 testcases/network/busy_poll/busy_poll02.sh    |  3 +-
 testcases/network/busy_poll/busy_poll03.sh    |  3 +-
 testcases/network/busy_poll/busy_poll_lib.sh  | 10 +--
 testcases/network/dccp/dccp01.sh              |  2 +-
 testcases/network/dhcp/dhcp_lib.sh            | 12 ++--
 testcases/network/dhcp/dhcpd_tests.sh         |  6 +-
 testcases/network/dhcp/dnsmasq_tests.sh       | 28 ++++----
 testcases/network/iproute/ip_tests.sh         |  2 +-
 testcases/network/iptables/iptables01.sh      |  1 -
 testcases/network/iptables/iptables_lib.sh    |  6 +-
 testcases/network/iptables/nft01.sh           |  3 +-
 testcases/network/mpls/mpls01.sh              |  2 +-
 testcases/network/mpls/mpls02.sh              |  3 +-
 testcases/network/mpls/mpls03.sh              |  5 +-
 testcases/network/mpls/mpls04.sh              |  5 +-
 testcases/network/mpls/mpls_lib.sh            |  4 +-
 .../network/multicast/mc_cmds/mc_cmds.sh      |  6 +-
 .../network/multicast/mc_commo/mc_commo.sh    |  5 +-
 .../network/multicast/mc_member/mc_member.sh  |  6 +-
 testcases/network/nfs/fsx-linux/fsx.sh        |  3 +-
 testcases/network/nfs/nfs_stress/nfs01.sh     |  3 +-
 testcases/network/nfs/nfs_stress/nfs02.sh     |  3 +-
 testcases/network/nfs/nfs_stress/nfs03.sh     |  3 +-
 testcases/network/nfs/nfs_stress/nfs04.sh     |  2 +-
 testcases/network/nfs/nfs_stress/nfs05.sh     |  3 +-
 testcases/network/nfs/nfs_stress/nfs06.sh     |  2 +-
 testcases/network/nfs/nfs_stress/nfs07.sh     |  8 +--
 testcases/network/nfs/nfs_stress/nfs_lib.sh   |  4 +-
 testcases/network/nfs/nfslock01/nfslock01.sh  |  3 +-
 testcases/network/nfs/nfsstat01/nfsstat01.sh  |  3 +-
 .../network/rpc/basic_tests/rpc01/rpc01.sh    |  2 +-
 testcases/network/rpc/basic_tests/rpc_lib.sh  |  5 +-
 .../rpc/basic_tests/rpcinfo/rpcinfo01.sh      |  2 +-
 .../network/rpc/basic_tests/rup/rup01.sh      |  1 -
 .../rpc/basic_tests/rusers/rusers01.sh        |  1 -
 testcases/network/rpc/rpc-tirpc/rpc_test.sh   |  2 +-
 testcases/network/sctp/sctp01.sh              |  2 +-
 testcases/network/sockets/bind_noport01.sh    |  2 +-
 .../stress/broken_ip/broken_ip-checksum.sh    |  2 +-
 .../stress/broken_ip/broken_ip-dstaddr.sh     |  2 +-
 .../stress/broken_ip/broken_ip-fragment.sh    |  2 +-
 .../network/stress/broken_ip/broken_ip-ihl.sh |  2 +-
 .../stress/broken_ip/broken_ip-nexthdr.sh     | 10 +--
 .../stress/broken_ip/broken_ip-plen.sh        |  2 +-
 .../stress/broken_ip/broken_ip-protcol.sh     |  2 +-
 .../stress/broken_ip/broken_ip-version.sh     |  2 +-
 testcases/network/stress/dccp/dccp_ipsec.sh   |  4 +-
 .../network/stress/dccp/dccp_ipsec_vti.sh     |  4 +-
 testcases/network/stress/dns/dns-stress.sh    |  6 +-
 .../network/stress/ftp/ftp-download-stress.sh |  4 +-
 .../network/stress/ftp/ftp-upload-stress.sh   |  4 +-
 testcases/network/stress/http/http-stress.sh  |  4 +-
 .../network/stress/icmp/icmp-uni-basic.sh     |  4 +-
 testcases/network/stress/icmp/icmp-uni-vti.sh |  4 +-
 .../stress/interface/if-addr-adddel.sh        |  4 +-
 .../stress/interface/if-addr-addlarge.sh      |  4 +-
 testcases/network/stress/interface/if-lib.sh  | 12 ++--
 .../network/stress/interface/if-mtu-change.sh |  4 +-
 .../stress/interface/if-route-adddel.sh       |  4 +-
 .../stress/interface/if-route-addlarge.sh     |  4 +-
 .../network/stress/interface/if-updown.sh     |  4 +-
 .../stress/interface/if4-addr-change.sh       |  2 +-
 testcases/network/stress/ipsec/ipsec_lib.sh   | 15 +++--
 .../mcast-group-multiple-socket.sh            |  2 +-
 .../grp-operation/mcast-group-same-group.sh   |  2 +-
 .../mcast-group-single-socket.sh              |  2 +-
 .../mcast-group-source-filter.sh              |  2 +-
 .../multicast/grp-operation/mcast-lib.sh      |  6 +-
 .../multicast/packet-flood/mcast-pktfld01.sh  |  2 +-
 .../multicast/packet-flood/mcast-pktfld02.sh  |  2 +-
 .../multicast/query-flood/mcast-queryfld01.sh |  2 +-
 .../multicast/query-flood/mcast-queryfld02.sh |  2 +-
 .../multicast/query-flood/mcast-queryfld03.sh |  2 +-
 .../multicast/query-flood/mcast-queryfld04.sh |  2 +-
 .../multicast/query-flood/mcast-queryfld05.sh |  2 +-
 .../multicast/query-flood/mcast-queryfld06.sh |  2 +-
 .../network/stress/ns-tools/tst_net_stress.sh |  4 +-
 .../network/stress/route/route-change-dst.sh  |  6 +-
 .../network/stress/route/route-change-gw.sh   |  6 +-
 .../network/stress/route/route-change-if.sh   |  6 +-
 .../stress/route/route-change-netlink-dst.sh  |  4 +-
 .../stress/route/route-change-netlink-gw.sh   |  4 +-
 .../stress/route/route-change-netlink-if.sh   |  4 +-
 testcases/network/stress/route/route-lib.sh   |  5 +-
 .../network/stress/route/route-redirect.sh    |  4 +-
 testcases/network/stress/sctp/sctp_ipsec.sh   |  4 +-
 .../network/stress/sctp/sctp_ipsec_vti.sh     |  4 +-
 testcases/network/stress/ssh/ssh-stress.sh    |  2 +-
 testcases/network/stress/tcp/tcp_ipsec.sh     |  4 +-
 testcases/network/stress/tcp/tcp_ipsec_vti.sh |  4 +-
 testcases/network/stress/udp/udp_ipsec.sh     |  4 +-
 testcases/network/stress/udp/udp_ipsec_vti.sh |  4 +-
 testcases/network/tcp_cc/bbr01.sh             |  3 +-
 testcases/network/tcp_cc/bbr02.sh             |  4 +-
 testcases/network/tcp_cc/dctcp01.sh           |  3 +-
 testcases/network/tcp_cc/tcp_cc_lib.sh        |  5 +-
 testcases/network/tcp_cmds/arping/arping01.sh |  2 +-
 .../network/tcp_cmds/clockdiff/clockdiff01.sh |  2 +-
 testcases/network/tcp_cmds/host/host01.sh     |  2 +-
 .../network/tcp_cmds/ipneigh/ipneigh01.sh     |  2 +-
 .../network/tcp_cmds/netstat/netstat01.sh     |  2 +-
 testcases/network/tcp_cmds/ping/ping01.sh     |  2 +-
 testcases/network/tcp_cmds/ping/ping02.sh     |  2 +-
 .../network/tcp_cmds/sendfile/sendfile01.sh   |  2 +-
 testcases/network/tcp_cmds/tc/tc01.sh         |  3 +-
 .../network/tcp_cmds/tcpdump/tcpdump01.sh     |  3 +-
 testcases/network/tcp_cmds/telnet/telnet01.sh |  3 +-
 .../network/tcp_cmds/tracepath/tracepath01.sh |  2 +-
 .../network/tcp_fastopen/tcp_fastopen_run.sh  |  2 +-
 testcases/network/traceroute/traceroute01.sh  |  2 +-
 testcases/network/virt/fou01.sh               |  2 +-
 testcases/network/virt/geneve01.sh            |  9 ++-
 testcases/network/virt/geneve02.sh            | 14 ++--
 testcases/network/virt/gre01.sh               |  2 +-
 testcases/network/virt/gre02.sh               |  2 +-
 testcases/network/virt/ipvlan01.sh            |  2 +-
 testcases/network/virt/macsec01.sh            |  1 -
 testcases/network/virt/macsec02.sh            |  1 -
 testcases/network/virt/macsec03.sh            |  3 +-
 testcases/network/virt/macsec_lib.sh          | 11 ++--
 testcases/network/virt/macvlan01.sh           |  2 +-
 testcases/network/virt/macvtap01.sh           |  2 +-
 testcases/network/virt/sit01.sh               |  2 +-
 testcases/network/virt/virt_lib.sh            | 36 +++++------
 testcases/network/virt/vlan01.sh              |  2 +-
 testcases/network/virt/vlan02.sh              |  2 +-
 testcases/network/virt/vlan03.sh              |  2 +-
 testcases/network/virt/vxlan01.sh             |  9 ++-
 testcases/network/virt/vxlan02.sh             |  5 +-
 testcases/network/virt/vxlan03.sh             |  2 +-
 testcases/network/virt/vxlan04.sh             |  2 +-
 testcases/network/virt/wireguard01.sh         |  3 +-
 testcases/network/virt/wireguard02.sh         |  6 +-
 testcases/network/virt/wireguard_lib.sh       |  4 +-
 testcases/network/xinetd/xinetd_tests.sh      |  2 +-
 327 files changed, 557 insertions(+), 590 deletions(-)

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
