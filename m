Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 615C9ACAF2E
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Jun 2025 15:38:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2367E3C9DD1
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Jun 2025 15:38:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB56D3C9CD2
 for <ltp@lists.linux.it>; Mon,  2 Jun 2025 15:37:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 53B766009F1
 for <ltp@lists.linux.it>; Mon,  2 Jun 2025 15:37:47 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B0321F443;
 Mon,  2 Jun 2025 13:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1748871467;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=kd24fYJl6q2mmSg7SdhXv6Pob329QD9L7tRSt4GRads=;
 b=Bk5jVAGMdlSEyyDQ5ocAbd3Kag86iXWCO4W/QNxrBVEXfsqIV6CK5BlNwrNjVdATA9v4C9
 htNTp7rdVNRZFsI2Qx0wkAfATCGmwbefJxsLYGNIqru89ChPzSNPDFm9I08Cc4YVK0n9Gh
 HKYs9b5Cq1F2kwWKNFai5Xk8Ocvg8hw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1748871467;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=kd24fYJl6q2mmSg7SdhXv6Pob329QD9L7tRSt4GRads=;
 b=zymgBT7RFMQXruzi0lyaTSIWCKTVYkB6ViGg5/JdLaNugyUCnQ0ch6PnLrEbjUSg8l0L9S
 FNMwGOxQ8a5sq9CQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Bk5jVAGM;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=zymgBT7R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1748871467;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=kd24fYJl6q2mmSg7SdhXv6Pob329QD9L7tRSt4GRads=;
 b=Bk5jVAGMdlSEyyDQ5ocAbd3Kag86iXWCO4W/QNxrBVEXfsqIV6CK5BlNwrNjVdATA9v4C9
 htNTp7rdVNRZFsI2Qx0wkAfATCGmwbefJxsLYGNIqru89ChPzSNPDFm9I08Cc4YVK0n9Gh
 HKYs9b5Cq1F2kwWKNFai5Xk8Ocvg8hw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1748871467;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type;
 bh=kd24fYJl6q2mmSg7SdhXv6Pob329QD9L7tRSt4GRads=;
 b=zymgBT7RFMQXruzi0lyaTSIWCKTVYkB6ViGg5/JdLaNugyUCnQ0ch6PnLrEbjUSg8l0L9S
 FNMwGOxQ8a5sq9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C71613A63;
 Mon,  2 Jun 2025 13:37:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GfntHiqpPWjFSAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 02 Jun 2025 13:37:46 +0000
Date: Mon, 2 Jun 2025 15:37:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Steve Dickson <steved@redhat.com>
Message-ID: <20250602133741.GA324895@pevik>
MIME-Version: 1.0
Content-Disposition: inline
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:replyto,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.cz:+]; MISSING_XM_UA(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Rspamd-Queue-Id: 0B0321F443
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.71
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [RFC] rpcbind: detect support of remote calls
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: linux-nfs@vger.kernel.org, "Ricardo B. Marliere" <rbm@suse.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Steve,

Ricardo found that TI-RPC rpc_pmap_rmtcall [1] tirpc_rpcb_rmtcall [2] tests are
failing when they use rpcbind *without* --enable-rmtcalls (the default since
2018, see 2e9c289 ("rpcbind: Disable remote calls by default") [3]).

TL;DR: Is there a way to detect missing support from rpcbind? Because we cannot
blindly expect that timeout means disabled remote calls (it could be also
caused by regression). Other option is just to disable these tests by default
(detection is preferred).

# export PATH="/opt/ltp/testcases/bin:$PATH"
# rpc_test.sh -s tirpc_svc_4 -c tirpc_rpcb_rmtcall
...
tirpc_rpcb_rmtcall 10.0.0.2 536875000
rpc_test 1 TFAIL: tirpc_rpcb_rmtcall 10.0.0.2 536875000 failed unexpectedly

As the name of the test suggests they are using pmap_rmtcall() and rpcb_rmtcall().
A bit debug info.

Modified rpc_test.sh to use strace:

+++ b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
@@ -87,6 +87,8 @@ do_test()
 		done
 	fi
 
+	echo "$CLIENT $(tst_ipaddr) $PROGNUMNOSVC $CLIENT_EXTRA_OPTS" # FIXME: debug
+	EXPECT_RHOST_PASS strace -o /tmp/a $CLIENT $(tst_ipaddr) $PROGNUMNOSVC $CLIENT_EXTRA_OPTS
 	EXPECT_RHOST_PASS $CLIENT $(tst_ipaddr) $PROGNUMNOSVC $CLIENT_EXTRA_OPTS
 }
 

I see the test timeouts (full strace output below):

# rpc_test.sh -s tirpc_svc_4 -c tirpc_rpcb_rmtcall
...
sendto(5, "h=\r}\0\0\0\0\0\0\0\2\0\1\206\240\0\0\0\4\0\0\0\5\0\0\0\0\0\0\0\0"..., 60, 0, {sa_family=AF_INET, sin_port=htons(111), sin_addr=inet_addr("10.0.0.2")}, 16) = 60
poll([{fd=5, events=POLLIN}], 1, 1000)  = 0 (Timeout)

Using rpcbind 1.2.7-1.2 (from Tumbleweed), output when run with debug mode:

# /usr/sbin/rpcbind -w -f -d
rpcbind: PMAPPROC_DUMP

rpcbind: RPCB_UNSET request for (536875000, 1, ) :
rpcbind: RPCB_UNSET: succeeded
rpcbind: RPCB_SET request for (536875000, 1, udp, 0.0.0.0.223.168) :
rpcbind: RPCB_SET: succeeded
rpcbind: RPCB_GETADDR req for (100000, 2, tcp) from 127.0.0.1.3.98:
mergeaddr: contact uaddr = 127.0.0.1.0.111
addrmerge(caller, 0.0.0.0.0.111, 127.0.0.1.0.111, tcp
addrmerge: hint 127.0.0.1.0.111
addrmerge: returning 127.0.0.1.0.111
mergeaddr: uaddr = 0.0.0.0.0.111, merged uaddr = 127.0.0.1.0.111
rpcbind: getaddr: 127.0.0.1.0.111
rpcbind: PMAPPROC_DUMP

rpcbind: RPCB_GETADDR req for (536875000, 1, udp) from 10.0.0.1.3.105:
mergeaddr: contact uaddr = 10.0.0.2.0.111
addrmerge(caller, 0.0.0.0.223.168, 10.0.0.2.0.111, udp
addrmerge: hint 10.0.0.2.0.111
addrmerge: returning 10.0.0.2.223.168
mergeaddr: uaddr = 0.0.0.0.223.168, merged uaddr = 10.0.0.2.223.168
rpcbind: getaddr: 10.0.0.2.223.168
rpcbind: RPCBPROC_BCAST

rpcbind: rpcb_indirect callit req for (536875000, 1, 1, udp) from 10.0.0.1.3.105 :
rpcbind: found at uaddr 0.0.0.0.223.168

addrmerge(caller, 0.0.0.0.223.168, NULL, udp
addrmerge: hint 127.0.0.1.0.111
addrmerge: returning 127.0.0.1.223.168
addrmerge(caller, 0.0.0.0.223.168, NULL, udp
addrmerge: hint 10.0.0.1.3.105
addrmerge: returning 192.168.122.43.223.168
rpcbind: merged uaddr 192.168.122.43.223.168

rpcbind: RPCB_UNSET request for (536875000, 1, ) :
rpcbind: Suppression RPC_UNSET(map_unset)
rpcbind: rbl->rpcb_map.r_owner=superuser
rpcbind: owner=superuser
rpcbind: RPCB_UNSET: succeeded

Obviously, if I compile rpcbind with --enable-rmtcalls and run it, both tests work:

$ ./autogen.sh && ./configure --enable-debug --enable-warmstarts --enable-rmtcalls --with-rpcuser=rpc --with-nss-modules="files usrfiles"
$ make -j`nproc`
# ./rpcbind -w -d -f

# rpc_test.sh -s tirpc_svc_4 -c tirpc_rpcb_rmtcall
...
rpc_test 1 TINFO: using libtirpc: yes
tirpc_rpcb_rmtcall 10.0.0.2 536875000
rpc_test 1 TPASS: tirpc_rpcb_rmtcall 10.0.0.2 536875000 passed as expected

# rpc_test.sh -s rpc_svc_1 -c rpc_pmap_rmtcall
...
rpc_pmap_rmtcall 10.0.0.2 536875000
rpc_test 1 TPASS: rpc_pmap_rmtcall 10.0.0.2 536875000 passed as expected


And the rpcbind outpt contains also:

rpcbind: rpcbproc_callit_com:  original XID 683f1705, new XID f68e200
rpcbind: my_svc_run:  polled on forwarding fd 7, netid udp - calling handle_reply

Also, wouldn't it be worth mention --enable-rmtcalls in functions' man pages?
(Or have I overlooked that in man?)

Thanks for any hint.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/tree/master/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_addrmanagmt_pmap_rmtcall/rpc_pmap_rmtcall.c
[2] https://github.com/linux-test-project/ltp/tree/master/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_expertlevel_rpcb_rmtcall/tirpc_rpcb_rmtcall.c
[3] https://git.linux-nfs.org/?p=steved/rpcbind.git;a=commitdiff;h=2e9c289246c647e25649914bdb0d9400c66f486e

Full strace on rpcbind compiled without --enable-rmtcalls (the default, thus
how it's shipped to the new distros):

# rpc_test.sh -s tirpc_svc_4 -c tirpc_rpcb_rmtcall

execve("/opt/ltp/testcases/bin/tirpc_rpcb_rmtcall", ["tirpc_rpcb_rmtcall", "10.0.0.2", "536875000"], 0x7ffee8701b10 /* 228 vars */) = 0
...
openat(AT_FDCWD, "/etc/services", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 5
...
openat(AT_FDCWD, "/usr/etc/services", O_RDONLY|O_CLOEXEC) = 5
fstat(5, {st_mode=S_IFREG|0644, st_size=868338, ...}) = 0
read(5, "#\n# Network services, Internet s"..., 4096) = 4096
read(5, "[Jon_Postel]\ndaytime            "..., 4096) = 4096
read(5, "gs          44/udp       # MPM F"..., 4096) = 4096
read(5, "emote Job Service \nnetrjs-2     "..., 4096) = 4096
read(5, "Jon_Postel]\nhostname           1"..., 4096) = 4096
close(5)                                = 0
socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP) = 5
getsockname(5, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("0.0.0.0")}, [128 => 16]) = 0
getsockopt(5, SOL_SOCKET, SO_TYPE, [2], [4]) = 0
openat(AT_FDCWD, "/etc/bindresvport.blacklist", O_RDONLY) = 6
fstat(6, {st_mode=S_IFREG|0644, st_size=415, ...}) = 0
read(6, "#\n# This file contains a list of"..., 4096) = 415
read(6, "", 4096)                       = 0
close(6)                                = 0
getsockname(5, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("0.0.0.0")}, [128 => 16]) = 0
getpid()                                = 28530
bind(5, {sa_family=AF_INET, sin_port=htons(722), sin_addr=inet_addr("0.0.0.0")}, 16) = 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
getsockname(5, {sa_family=AF_INET, sin_port=htons(722), sin_addr=inet_addr("0.0.0.0")}, [128 => 16]) = 0
getsockopt(5, SOL_SOCKET, SO_TYPE, [2], [4]) = 0
gettimeofday({tv_sec=1748867467, tv_usec=890549}, NULL) = 0
getpid()                                = 28530
setsockopt(5, SOL_IP, IP_RECVERR, [1], 4) = 0
ioctl(5, FIONBIO, [1])                  = 0
...
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], [], 8) = 0
sendto(5, "h0`M\0\0\0\0\0\0\0\2\0\1\206\240\0\0\0\4\0\0\0\3\0\0\0\0\0\0\0\0"..., 88, 0, {sa_family=AF_INET, sin_port=htons(111), sin_addr=inet_addr("10.0.0.2")}, 16) = 88
poll([{fd=5, events=POLLIN}], 1, 15000) = 1 ([{fd=5, revents=POLLIN}])
recvfrom(5, "h0`M\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\02010.0"..., 8800, 0, NULL, NULL) = 44
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], [], 8) = 0
close(5)                                = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP) = 5
getsockname(5, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("0.0.0.0")}, [128 => 16]) = 0
getsockopt(5, SOL_SOCKET, SO_TYPE, [2], [4]) = 0
getsockname(5, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("0.0.0.0")}, [128 => 16]) = 0
getpid()                                = 28530
bind(5, {sa_family=AF_INET, sin_port=htons(722), sin_addr=inet_addr("0.0.0.0")}, 16) = 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
getsockname(5, {sa_family=AF_INET, sin_port=htons(722), sin_addr=inet_addr("0.0.0.0")}, [128 => 16]) = 0
getsockopt(5, SOL_SOCKET, SO_TYPE, [2], [4]) = 0
gettimeofday({tv_sec=1748867467, tv_usec=892984}, NULL) = 0
getpid()                                = 28530
setsockopt(5, SOL_IP, IP_RECVERR, [1], 4) = 0
ioctl(5, FIONBIO, [1])                  = 0
...
sendto(5, "h0V\302\0\0\0\0\0\0\0\2\0\1\206\240\0\0\0\4\0\0\0\5\0\0\0\0\0\0\0\0"..., 60, 0, {sa_family=AF_INET, sin_port=htons(111), sin_addr=inet_addr("10.0.0.2")}, 16) = 60
poll([{fd=5, events=POLLIN}], 1, 1000)  = 0 (Timeout)
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], [], 8) = 0
close(5)                                = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
fstat(1, {st_mode=S_IFIFO|0600, st_size=0, ...}) = 0
write(1, "1\n", 2)                      = 2
exit_group(1)                           = ?
+++ exited with 1 +++

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
