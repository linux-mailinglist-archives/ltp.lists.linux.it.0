Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D878887C9CA
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Mar 2024 09:17:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 963AC3D09FA
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Mar 2024 09:17:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 610B33CFCCA
 for <ltp@lists.linux.it>; Fri, 15 Mar 2024 09:17:44 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com;
 envelope-from=oliver.sang@intel.com; receiver=lists.linux.it)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DF6BA20EB3C
 for <ltp@lists.linux.it>; Fri, 15 Mar 2024 09:17:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710490663; x=1742026663;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=vNwqcYkPu4lk0hLhLivpjLZ/iaMh8gG5JTvBYtsuyOU=;
 b=gnaBjf5JO+4mRKF8LMvMzP8gOV7UJJqRHQcFAQ23A1Hja0jwqVsF6RgI
 h79ROaDIeuQE5EPA3L+J/hqJTAPvTEVjpL3jidFkN1PFk0SnMuttUhvy3
 pvS9SzXaLlOKzi6jccbzSyrPEyzloGKlNySEd+Z7PqYU4BJzbagnNxrRQ
 5Fh/Ckzk6qRC3p09d4GBJSs0TgY03SFUZT1k00v7FqwELaUbXLN+wZ4H+
 2pfMybwAUf9GYlGitz2lvN975Sq8Yc+SYiUJ9kEYFvnNOlVazfAMkeZYi
 YQHrvIYmkA1kFF/doBbxAPNUfpCfq/6QQIPcjLq1BQcT6w7cpJC9TrpuX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="8286425"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="8286425"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 01:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12491087"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 01:16:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 01:16:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 01:16:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 01:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACgc9MMK9YCDr/EoF9WORE3Jf0tPaqCVkV9okNDUPrZOU3SOmC+f65FRb1OiAoIL6aSltt7jrOhuPJwm7NA1pVGgQRlOhGr4QsKVaHEFCdTRU1E41DL7trbTWmpYRIEVulZSY+caAQFzXNbRqAH8ANqyzl9flf/0xRCAGLK05RzFgt97UdGRuvXH84n4dHPYd3QaHUccNiv1euClFkGh4xpYoPYhQMcNsXyRh0S5+jID9gLhkU8nTE69Zu2wT/sPZ9RL/ltiO8BRSQF0s4yMkj0+X1MtRDy69Yoh4aKG5JXYmEO1mV19qLkxBV0Ls2ldqMwhjGUL6Igu1e8bnM0Bpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+BfatW0yv1AAhbg5b4tLlEd/TSh7Z0jn+0vBBCZkVc=;
 b=YoJDirvdtH3P32hacRsOIa2pFwHgpyYLVM+664YRf5Qw7nd551ELPLCFbAz2SVtuWQMBMZVsh4wEOlDH3CeWaoyxeJK0jOHjcsAoldp0MKaBK6OJ7xXCYPZ14Zj16ntXzquZwlLWfe1YVsRi9CckPfeBlsPCQkOYKQOokcm9o5F/CRBRnBqoVTH0Z/C/TXHwuuZbg2IZ+THrXzDDCSx2BoqorC7N8xLSG4kEFNwZE4bEMwngdzWCOxqqd5nEOo9X1UB9cgwKTveb6y9NnLYb61UVVsK408Ow8rgjjqCYCA1h24M6pi7SF12zKI1Z7xWccgVHK6gqvufWHsdQ5jgi6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Fri, 15 Mar
 2024 08:16:40 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 08:16:40 +0000
Date: Fri, 15 Mar 2024 16:16:33 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <202403151507.5540b773-oliver.sang@intel.com>
Content-Disposition: inline
X-ClientProxiedBy: SGBP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::15)
 To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f259f3-46c3-4b05-f048-08dc44c83df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CUtXMUfWX+mYB690YcySSfeobkAqvwDXgvema9tBf2gAJivhLjBsn8RvmVFxdDiKfwtuHVpEntSr9blTYxkFZCBIC/25h+aaXFAH/+8l1S/0/ZgkenxoauTeggJ9cZ0yrhRkaCYpgrQh8OknNkmAwjyWi1PSSyQ6gF2/BdANaWBrFdJZVxLWt/18PSIhUQ+EMfN1riR9s1/aoOl8t8cbbTDmHjNi+47fE30S7378PO6O/GCro22Jo1MZAAA+NRCW24y18CvUTrKECrXsmH5ntnh/QpuHdlf/mb5vik5qxRY3A9uGrCALha6PQCoYPUjeHxx9a2wC7fiHXk6+gz5bGxyGdrWyxxO3gK0R6QRAp+V4HzbEnpD5kKDau5BneIJyywvZARJRHRkJ8l3FkDUOEBb76JYj9ws62pB+jKeHTeXEjhSwwkNmXf2aEiuwCNQN5r41XhX2ZJl/OqaLfP5WGSfe0XJ9jGtvKKJfJiADW8jRfnI/DWe0/NwUmBgsj4hWcKNaJ7TY4MBlPia07hx5W1g0RTnJVZTZSz95GksFw6Iy3xqzW+ZdQtyL8lWi2uiTTxeaX3UkeFq24zjcXGBZ7fpmLh2Z4S29BQ907YTyksEHEqfV+QjcHTZNIJ1nDf9t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NI8iK78cburKXlkxWkzg2nw0fuSKwEr15OnqWpQPsVjYPBo/VjQB9Qj8QhGV?=
 =?us-ascii?Q?visEdzkiiNX3JsrRuqYg7If5NXQEQl0X0Tx/HMaMaNzbUrh0SviWsvltLylC?=
 =?us-ascii?Q?4KhGXW8CD5bKNlmLM0b3lQKeisNofML/PBiYaKiOGk3Rpgu/sBejZfi83vuM?=
 =?us-ascii?Q?JR5H/1aEteRgFdJ2pktI6dGwDonvTUBNi+mmvJwabgayBMg2EvHWOJLoPugI?=
 =?us-ascii?Q?u67w00+M5nzvOHiXy4JiM0CQbwqnL4raGA2YbvWVnFhlYiUM9X9nNl3aPgh2?=
 =?us-ascii?Q?2S4VQjzrYjG3UkvBxXf/gLVQo32jJtWtCrNaXBJa9QImbgNfQKQTWeJ2/9se?=
 =?us-ascii?Q?sq2ipVOwfN0qNFB/gdN1Ciifbi03CNvKXiilSJo2jti0ionUusG+/8y1PKwL?=
 =?us-ascii?Q?gyZMk1DokCZAIV8mXoFiNSd2B8xJVqSja8TjhdEjf4nqUxRgQS5lwgxvNbgL?=
 =?us-ascii?Q?tUK8SgjLuP5xS0adlVJRYSANjTbDT4yMS7HSXc+ZJEMAKRIxt+JAVMv1Mi9f?=
 =?us-ascii?Q?d7z5OJaeANLV6nYNaFOutRF8d9p+llZjBOj7LSbSo+JV/ogt2khFu/RNVwoS?=
 =?us-ascii?Q?fxYUp9dbcH8hZCAyrKzQnA7F76wKvXrQdhnVsC0rMZeN/8RdEckP88gggnbx?=
 =?us-ascii?Q?1ikhP6f+PfhiDxeXdqF0EMndVYT7kxy4CLS7k4/Nc+FMiu4EIIDW3g9YHrCw?=
 =?us-ascii?Q?mIUJGHs4VMvZ8sxSZQ18skzlUGJjYTd1Pq/ElMYCN9uTfXiF6p5SnZAY5aSx?=
 =?us-ascii?Q?q8M5/sHqO6UmEv7cx8yV1qHSmiFvSMoVyH+vlxZ4rtwCTs0Q7ErZ+1XjZVpf?=
 =?us-ascii?Q?+fysBwYLEIlapITFOGOSUVuGuhFXjAOgm1RVR9TetYJ+k5Js8YM7TooZ9Agu?=
 =?us-ascii?Q?U7ZdVz7I4guX/2954xlJDCiPdjvQJvJj/+2vv2NqYt3nznwSypbYUGaf2xw5?=
 =?us-ascii?Q?fut6JBaIir1b7TMvpABpqeucuOzaHh6dNHwxNk4OESHYUdX4l42fbPhy5gX1?=
 =?us-ascii?Q?X8jmNtU4Qq5XnCWlkZ3Aj1CDYgLJa1j9L2OkQHrofQmmPbQOOnX/G5IqNhSl?=
 =?us-ascii?Q?pMRT8dqC36qBlNTzoqU6K2rDYJSRycyTyN13gF9uJlq4/H8FqXxzTQ/mAkvO?=
 =?us-ascii?Q?OJ6BZN8DhiEw1OhX5twqCrJpUuACQmxsDh58WeSqHgv+gSdUJU/a2g2/xa9r?=
 =?us-ascii?Q?PC3g8oEgxwAQ2d9vZ3Oc18NXD1pAnhTKbAI4HxI+yL6KIgN6xtJK/HNFtLz1?=
 =?us-ascii?Q?dD2w66rcTzMyDO36lT1kJdpZbBNa7fx0VDcNmwrh8ODQAzUk7r8RnIxJgXr/?=
 =?us-ascii?Q?RNVe2QNoVa79VaVD5qh+W13A1fglIGryHRrHuAPWFrPQxjzT6qmC8n/pyfod?=
 =?us-ascii?Q?5NbYnLkJAPBF/hc7AmtWEMOCdt01vaVjljGqNTktwv1pUZh3G7T8Y/FFkeGD?=
 =?us-ascii?Q?2GxU+Eg1xghD/0iIQ0qYrCX44WY5IKmx1oqzQrgbhUzPteSQUjObK3Q9sCAc?=
 =?us-ascii?Q?Rik01ymn+Nn9764t2tf4iYDK6nz2VzmSAbz6znzWNUMxp1j32ytMuYguhQyS?=
 =?us-ascii?Q?jX5H/u8oZAofXf3LqcR3JlM1T7Td7WnvfQTrQxkg4QcfX58mgQqujmJ3i8ok?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f259f3-46c3-4b05-f048-08dc44c83df8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 08:16:40.6670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THwGMXcuo1NALoHfj+HKYvj9r+xpRF7CqYk2q8Jdg0nyHMUWt5ISxZFuIJZECgsMSivnuoJV8FPTbglNlBbUAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6370
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=0.1 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled
 version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [linus:master] [pidfd]  cb12fd8e0d: ltp.readahead01.fail
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 oliver.sang@intel.com, oe-lkp@lists.linux.dev, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



Hello,

kernel test robot noticed "ltp.readahead01.fail" on:

commit: cb12fd8e0dabb9a1c8aef55a6a41e2c255fcdf4b ("pidfd: add pidfs")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master 65d287c7eb1d14e0f4d56f19cec30d97fc7e8f66]
[test failed on linux-next/master a1184cae56bcb96b86df3ee0377cec507a3f56e0]

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20240309
with following parameters:

	disk: 1HDD
	fs: f2fs
	test: syscalls-00/readahead01



compiler: gcc-12
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202403151507.5540b773-oliver.sang@intel.com



Running tests.......
<<<test_start>>>
tag=readahead01 stime=1710262698
cmdline="readahead01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1741: TINFO: LTP version: 20240129-91-gcbc2d0568
tst_test.c:1625: TINFO: Timeout per run is 0h 02m 30s
readahead01.c:36: TPASS: readahead() with fd = -1 : EBADF (9)
readahead01.c:43: TPASS: readahead() with invalid fd : EBADF (9)
readahead01.c:63: TPASS: readahead() on O_PATH file : EBADF (9)
readahead01.c:63: TPASS: readahead() on directory : EINVAL (22)
readahead01.c:63: TPASS: readahead() on /dev/zero : EINVAL (22)
readahead01.c:63: TPASS: readahead() on pipe read end : EINVAL (22)
readahead01.c:63: TPASS: readahead() on pipe write end : EBADF (9)
readahead01.c:63: TPASS: readahead() on unix socket : EINVAL (22)
readahead01.c:63: TPASS: readahead() on inet socket : EINVAL (22)
readahead01.c:63: TPASS: readahead() on epoll : EINVAL (22)
readahead01.c:63: TPASS: readahead() on eventfd : EINVAL (22)
readahead01.c:63: TPASS: readahead() on signalfd : EINVAL (22)
readahead01.c:63: TPASS: readahead() on timerfd : EINVAL (22)
readahead01.c:63: TFAIL: readahead() on pidfd succeeded
readahead01.c:63: TPASS: readahead() on fanotify : EINVAL (22)
readahead01.c:63: TPASS: readahead() on inotify : EINVAL (22)
readahead01.c:63: TPASS: readahead() on userfaultfd : EINVAL (22)
readahead01.c:63: TPASS: readahead() on perf event : EINVAL (22)
readahead01.c:63: TPASS: readahead() on io uring : EINVAL (22)
readahead01.c:63: TPASS: readahead() on bpf map : EINVAL (22)
readahead01.c:63: TPASS: readahead() on fsopen : EINVAL (22)
readahead01.c:63: TPASS: readahead() on fspick : EINVAL (22)
readahead01.c:63: TPASS: readahead() on open_tree : EBADF (9)

Summary:
passed   22
failed   1
broken   0
skipped  0
warnings 0
incrementing stop
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=1 corefile=no
cutime=0 cstime=3
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20240129-91-gcbc2d0568

       ###############################################################

            Done executing testcases.
            LTP Version:  20240129-91-gcbc2d0568
       ###############################################################




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240315/202403151507.5540b773-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
