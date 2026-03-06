Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBYqJETGqmnVWwEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 13:19:16 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 194372206BA
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Mar 2026 13:19:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99C953CEE36
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2026 13:19:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A329C3C19CE
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 13:19:05 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E00CA100023D
 for <ltp@lists.linux.it>; Fri,  6 Mar 2026 13:19:03 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2A6CE3E7F0;
 Fri,  6 Mar 2026 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772799542;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RLt4nl9ne4qIzBZODffLLX9iNOga67tehke/LTcSxmE=;
 b=UYkMh+9cJIdB7QoOjLQp56y5Z0uF2eZAefdRWxMGvHOKU08t+sHIWOJujm5LftrKT8gzNa
 a2Wo9QzFrApL7LNa/Ofa9s8l96QhN0VNGjg2UYW1otLC30xa6BZUoPxbb/AWRUJ+E2fu7u
 //yOhYGV40diX7Hvzd8noqdHU4hlO0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772799542;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RLt4nl9ne4qIzBZODffLLX9iNOga67tehke/LTcSxmE=;
 b=xv2f40NEhvtcg7ncuiEg2A7WdRU0Ik0vsbs329RjIKH+djpuWWbEIUUfVKr8W0T5GeCZ0R
 MiCmuri2pYywKQAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=UYkMh+9c;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=xv2f40NE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772799542;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RLt4nl9ne4qIzBZODffLLX9iNOga67tehke/LTcSxmE=;
 b=UYkMh+9cJIdB7QoOjLQp56y5Z0uF2eZAefdRWxMGvHOKU08t+sHIWOJujm5LftrKT8gzNa
 a2Wo9QzFrApL7LNa/Ofa9s8l96QhN0VNGjg2UYW1otLC30xa6BZUoPxbb/AWRUJ+E2fu7u
 //yOhYGV40diX7Hvzd8noqdHU4hlO0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772799542;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RLt4nl9ne4qIzBZODffLLX9iNOga67tehke/LTcSxmE=;
 b=xv2f40NEhvtcg7ncuiEg2A7WdRU0Ik0vsbs329RjIKH+djpuWWbEIUUfVKr8W0T5GeCZ0R
 MiCmuri2pYywKQAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E020D3EA75;
 Fri,  6 Mar 2026 12:19:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iCBiNTXGqmloLgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 06 Mar 2026 12:19:01 +0000
Date: Fri, 6 Mar 2026 13:19:00 +0100
From: Petr Vorel <pvorel@suse.cz>
To: kernel test robot <oliver.sang@intel.com>
Message-ID: <20260306121900.GB519430@pevik>
References: <202602042124.87bd00e3-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202602042124.87bd00e3-lkp@intel.com>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [linux-next:master] [ext4] 81d2e13a57: ltp.fanotify22.fail
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 lkp@intel.com, "Darrick J. Wong" <djwong@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, oe-lkp@lists.linux.dev,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 194372206BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:replyto,intel.com:email,01.org:url,picard.linux.it:rdns,picard.linux.it:helo];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,intel.com,gmail.com,lists.linux.dev,vger.kernel.org,lst.de,lists.linux.it];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.cz:-];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Hi all,

[ Cc Amir, although this might be more related to ext4 than fanotify ]

Kind regards,
Petr

> Hello,

> kernel test robot noticed "ltp.fanotify22.fail" on:

> commit: 81d2e13a57c9d73582527966fae24d4fd73826ca ("ext4: convert to new fserror helpers")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

> [test failed on linux-next/master 33a647c659ffa5bdb94abc345c8c86768ff96215]

> in testcase: ltp
> version: 
> with following parameters:

> 	disk: 1HDD
> 	fs: btrfs
> 	test: syscalls-02/fanotify22


> config: x86_64-rhel-9.4-ltp
> compiler: gcc-14
> test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

> (please refer to attached dmesg/kmsg for entire log/backtrace)


> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202602042124.87bd00e3-lkp@intel.com


> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260204/202602042124.87bd00e3-lkp@intel.com


> user  :notice: [  423.546026] [    T265] 	Hostname:   lkp-ivb-d04

> user  :notice: [  423.554417] [    T265] 	Python:     3.13.5 (main, Jun 25 2025, 18:55:22) [GCC 14.2.0]

> user  :notice: [  423.570800] [    T265] 	Directory:  /tmp/kirk.root/tmpefuyb6o0



> user  :notice: [  423.584852] [    T265] Connecting to SUT: default

> user  :warn  : [  423.586640] [   T5587] /lkp/benchmarks/ltp/kirk[5563]: fanotify22: start (command: fanotify22)


> user  :notice: [  423.605665] [    T265] Starting suite: temp_single_test

> user  :notice: [  423.613894] [    T265] ---------------------------------

> kern  :info  : [  423.633832] [   T5592] loop: module loaded
> kern  :info  : [  423.657047] [   T5591] loop0: detected capacity change from 0 to 614400
> kern  :err   : [  423.821741] [   T5591] /dev/zero: Can't lookup blockdev
> kern  :info  : [  424.033575] [   T5591] EXT4-fs (loop0): mounted filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9 r/w with ordered data mode. Quota mode: none.
> kern  :info  : [  424.098309] [   T5607] EXT4-fs (loop0): unmounting filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9.
> kern  :info  : [  424.345598] [   T5607] EXT4-fs (loop0): mounted filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9 r/w with ordered data mode. Quota mode: none.
> kern  :crit  : [  424.414068] [   T5607] EXT4-fs error (device loop0): __ext4_remount:6794: comm fanotify22: Abort forced by user
> kern  :err   : [  424.423984] [   T5607] Aborting journal on device loop0-8.
> kern  :crit  : [  424.463989] [   T5607] EXT4-fs (loop0): Remounting filesystem read-only
> kern  :info  : [  424.470416] [   T5607] EXT4-fs (loop0): re-mounted 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9 ro.
> kern  :info  : [  424.479591] [   T5607] EXT4-fs (loop0): unmounting filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9.
> kern  :warn  : [  424.490528] [   T5607] EXT4-fs (loop0): warning: mounting fs with errors, running e2fsck is recommended
> kern  :info  : [  424.539426] [   T5607] EXT4-fs (loop0): mounted filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9 r/w with ordered data mode. Quota mode: none.
> kern  :crit  : [  424.552662] [   T5607] EXT4-fs error (device loop0): ext4_lookup:1785: inode #32386: comm fanotify22: iget: bogus i_mode (377)
> kern  :info  : [  424.617262] [   T5607] EXT4-fs (loop0): unmounting filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9.
> kern  :warn  : [  424.703481] [   T5607] EXT4-fs (loop0): warning: mounting fs with errors, running e2fsck is recommended
> kern  :info  : [  424.752431] [   T5607] EXT4-fs (loop0): mounted filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9 r/w with ordered data mode. Quota mode: none.
> kern  :crit  : [  424.765440] [   T5607] EXT4-fs error (device loop0): ext4_lookup:1777: inode #32385: comm fanotify22: bad inode number: 1
> kern  :crit  : [  424.776331] [   T5607] EXT4-fs error (device loop0): ext4_lookup:1785: inode #32386: comm fanotify22: iget: bogus i_mode (377)
> kern  :info  : [  424.845037] [   T5607] EXT4-fs (loop0): unmounting filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9.
> kern  :warn  : [  424.928434] [   T5607] EXT4-fs (loop0): warning: mounting fs with errors, running e2fsck is recommended
> kern  :info  : [  424.985535] [   T5607] EXT4-fs (loop0): mounted filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9 r/w with ordered data mode. Quota mode: none.
> kern  :crit  : [  424.998543] [   T5607] EXT4-fs error (device loop0): ext4_lookup:1785: inode #32386: comm fanotify22: iget: bogus i_mode (377)
> kern  :crit  : [  425.115411] [   T5607] EXT4-fs error (device loop0): __ext4_remount:6794: comm fanotify22: Abort forced by user
> kern  :err   : [  425.125337] [   T5607] Aborting journal on device loop0-8.
> kern  :crit  : [  425.191808] [   T5607] EXT4-fs (loop0): Remounting filesystem read-only
> kern  :info  : [  425.198225] [   T5607] EXT4-fs (loop0): re-mounted 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9 ro.
> kern  :info  : [  425.207311] [   T5607] EXT4-fs (loop0): unmounting filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9.
> kern  :warn  : [  425.218247] [   T5607] EXT4-fs (loop0): warning: mounting fs with errors, running e2fsck is recommended
> kern  :info  : [  425.255422] [   T5607] EXT4-fs (loop0): mounted filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9 r/w with ordered data mode. Quota mode: none.
> kern  :info  : [  425.300422] [   T5591] EXT4-fs (loop0): unmounting filesystem 6b5acef8-3cdb-48f2-8af0-b27b5ee321e9.
> user  :notice: [  425.421952] [    T265] \x1b[1;37mfanotify22: \x1b[0m\x1b[1;31mfail\x1b[0m | \x1b[1;33mtainted\x1b[0m  (1.808s)

> user  :warn  : [  425.427743] [   T5635] /lkp/benchmarks/ltp/kirk[5563]: fanotify22: end (returncode: 1)
> user  :notice: [  425.447575] [    T265]                                                                                                                                 

> user  :notice: [  425.463971] [    T265] Execution time: 1.866s



> user  :notice: [  425.476018] [    T265] 	Suite:       temp_single_test

> user  :notice: [  425.483786] [    T265] 	Total runs:  1

> user  :notice: [  425.490690] [    T265] 	Runtime:     1.808s

> user  :notice: [  425.497330] [    T265] 	Passed:      3

> user  :notice: [  425.503518] [    T265] 	Failed:      1

> user  :notice: [  425.509637] [    T265] 	Skipped:     0

> user  :notice: [  425.515735] [    T265] 	Broken:      0

> user  :notice: [  425.521820] [    T265] 	Warnings:    0

> user  :notice: [  425.529960] [    T265] 	Kernel:      Linux 6.19.0-rc1-00006-g81d2e13a57c9 #1 SMP PREEMPT_DYNAMIC Sat Jan 31 20:49:54 CST 2026

> user  :notice: [  425.543805] [    T265] 	Machine:     unknown

> user  :notice: [  425.550576] [    T265] 	Arch:        x86_64

> user  :notice: [  425.557336] [    T265] 	RAM:         6899604 kB

> user  :notice: [  425.564451] [    T265] 	Swap:        0 kB

> user  :notice: [  425.571112] [    T265] 	Distro:      debian 13



> user  :notice: [  425.582858] [    T265] Disconnecting from SUT: default

> user  :notice: [  425.590377] [    T265] Session stopped

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
