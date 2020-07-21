Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF6C22766A
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 05:12:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81A663C4E22
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 05:12:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 430553C2123
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 05:12:36 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 8901C14013A6
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 05:12:33 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; d="scan'208";a="96677594"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 11:12:32 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id E96304CE506E;
 Tue, 21 Jul 2020 11:12:28 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 11:12:27 +0800
Message-ID: <5F165D1A.80605@cn.fujitsu.com>
Date: Tue, 21 Jul 2020 11:12:26 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200720183208.3140-1-pvorel@suse.cz>
In-Reply-To: <20200720183208.3140-1-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E96304CE506E.AA9DE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] testscripts: Remove exportfs.sh
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/7/21 2:32, Petr Vorel wrote:
> Script is outdated (uses directly rsh, reiserfs, jfs).
>
> Testing to mount NFS with exportfs is done in NFS tests (in nfs_lib.sh)
> and also partly in statx07, thus not needed to turn this script into LTP
> test.
Hi Petr,

LGTM.

Acked-by: Xiao Yang <yangx.jy@cn.fujitsu.com>

One question:
We need to mount the specified filesystem(e.g. a partition formated with xfs) on $TMPDIR
manually if we try to test nfs with different underlying filesystems. Right?

Thanks,
Xiao Yang
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  doc/ltp-run-files.txt   |   1 -
>  testscripts/exportfs.sh | 208 ----------------------------------------
>  2 files changed, 209 deletions(-)
>  delete mode 100755 testscripts/exportfs.sh
>
> diff --git a/doc/ltp-run-files.txt b/doc/ltp-run-files.txt
> index c29086987..6719351d1 100644
> --- a/doc/ltp-run-files.txt
> +++ b/doc/ltp-run-files.txt
> @@ -71,7 +71,6 @@ other filesystem or disk type tests
>   - autofs1.sh
>   - autofs4.sh
>   - diskio.sh
> - - exportfs.sh
>   - isofs.sh
>   - sysfs.sh
>  
> diff --git a/testscripts/exportfs.sh b/testscripts/exportfs.sh
> deleted file mode 100755
> index 8afe017d8..000000000
> --- a/testscripts/exportfs.sh
> +++ /dev/null
> @@ -1,208 +0,0 @@
> -#!/bin/bash
> -
> -
> -##############################################################
> -#
> -#  Copyright (c) International Business Machines  Corp., 2003
> -#
> -#  This program is free software;  you can redistribute it and/or modify
> -#  it under the terms of the GNU General Public License as published by
> -#  the Free Software Foundation; either version 2 of the License, or
> -#  (at your option) any later version.
> -#
> -#  This program is distributed in the hope that it will be useful,
> -#  but WITHOUT ANY WARRANTY;  without even the implied warranty of
> -#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> -#  the GNU General Public License for more details.
> -#
> -#  You should have received a copy of the GNU General Public License
> -#  along with this program;  if not, write to the Free Software
> -#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> -#
> -#  FILE        : exportfs.sh
> -#  USAGE       : exportfs.sh -h <nfs_server> -d <nfs_server_disk_partition>
> -#                            -t <server_fs_type>
> -#
> -#  DESCRIPTION : A script that will test exportfs on Linux system.
> -#  REQUIREMENTS:
> -#                1) NFS Server system with rsh enabled between client & server.
> -#                2) 100MB Disk partition on NFS server.
> -#
> -#  HISTORY     :
> -#      06/18/2003 Prakash Narayana (prakashn@us.ibm.com)
> -#
> -#  CODE COVERAGE: 7.1% - fs/exportfs (Total Coverage)
> -#                 7.1% - fs/exportfs/expfs.c
> -#
> -##############################################################
> -
> -
> -NFS_SERVER=""
> -REM_DISK_PART=""
> -FS_TYPE=""
> -MNT_POINT="/tmp/exportfs_$$"
> -
> -USAGE="$0 -h <nfs_server> -d <nfs_server_disk_partition> -t <server_fs_type>"
> -
> -
> -##############################################################
> -#
> -# Make sure that uid=root is running this script.
> -# Validate the command line arguments.
> -# Make sure that NFS Server is up with rsh is enabled.
> -# Make sure that FS_TYPE package has been installed on NFS Server side.
> -# Make sure that FS_TYPE module is built into the kernel or loaded
> -# on NFS Server side.
> -#
> -##############################################################
> -
> -if [ $UID != 0 ]
> -then
> -	echo "FAILED: Must have root access to execute this script"
> -	exit 1
> -fi
> -
> -while getopts h:d:t: args
> -do
> -	case $args in
> -	h)	NFS_SERVER=$OPTARG ;;
> -	d)	REM_DISK_PART=$OPTARG ;;
> -	t)	FS_TYPE=$OPTARG ;;
> -	\?)	echo $USAGE ; exit 1 ;;
> -	esac
> -done
> -
> -if [ -z "$NFS_SERVER" ]
> -then
> -	echo $USAGE
> -	echo "FAILED: NFS Server not specificed"
> -	exit 1
> -fi
> -
> -if [ -z "$REM_DISK_PART" ]
> -then
> -	echo $USAGE
> -	echo "FAILED: NFS Server disk partition not specified"
> -	exit 1
> -fi
> -
> -if [ -z "$FS_TYPE" ]
> -then
> -	echo $USAGE
> -	echo "FAILED: NFS Server file system type not specified"
> -	exit 1
> -fi
> -
> -#
> -# How to check if it a valid block special device on NFS Server ???
> -# Add code here.
> -
> -
> -ping -c 2 -w 15 $NFS_SERVER >/dev/null 2>&1
> -if [ $? != 0 ]
> -then
> -	echo "FAILED: ping $NFS_SERVER failed"
> -	exit 1
> -fi
> -
> -rsh -n -l root $NFS_SERVER "ls -l /etc" >/dev/null 2>&1
> -if [ $? != 0 ]
> -then
> -	echo "FAILED: rsh -n -l root $NFS_SERVER "ls -l /etc" failed"
> -	exit 1
> -fi
> -
> -rsh -n -l root $NFS_SERVER "rpm -q -a | grep $FS_TYPE" | grep $FS_TYPE >/dev/null 2>&1
> -if [ $? != 0 ]
> -then
> -	rsh -n -l root $NFS_SERVER "grep $FS_TYPE /etc/filesystems" | grep $FS_TYPE >/dev/null 2>&1
> -	if [ $? != 0 ]
> -	then
> -		rsh -n -l root $NFS_SERVER "grep $FS_TYPE /proc/filesystems" | grep $FS_TYPE >/dev/null 2>&1
> -		if [ $? != 0 ]
> -		then
> -			echo "FAILED: $FS_TYPE package is not installed or loaded on $NFS_SERVER"
> -			exit 1
> -		fi
> -	fi
> -fi
> -
> -if [ "$FS_TYPE" = "reiserfs" ]
> -then
> -#	rsh -n -l root $NFS_SERVER "/sbin/mkfs -t $FS_TYPE --format 3.6 -f $REM_DISK_PART >/dev/null 2>&1"
> -	rsh -n -l root $NFS_SERVER "/sbin/mkfs -t $FS_TYPE -f $REM_DISK_PART --format 3.6 >/dev/null 2>&1"
> -	echo "/sbin/mkfs -t $FS_TYPE --format 3.6 -f $REM_DISK_PART >/dev/null 2>&1"
> -else
> -#	rsh -n -l root $NFS_SERVER "/sbin/mkfs -t $FS_TYPE $REM_DISK_PART >/dev/null 2>&1"
> -	QUIETFLAG=
> -	if [ "$FS_TYPE" = "jfs" ]
> -	then
> -		QUIETFLAG="-q"
> -	fi
> -	rsh -n -l root $NFS_SERVER "/sbin/mkfs -t $FS_TYPE $QUIETFLAG $REM_DISK_PART >/dev/null 2>&1"
> -	if [ $? != 0 ]
> -	then
> -		echo "FAILED: Could not /sbin/mkfs -t $FS_TYPE $REM_DISK_PART on $NFS_SERVER"
> -		exit 1
> -	fi
> -fi
> -
> -rsh -n -l root $NFS_SERVER "mkdir -p -m 777 $MNT_POINT"
> -if [ $? != 0 ]
> -then
> -	echo "FAILED: Could not mkdir -p -m 777 $MNT_POINT on $NFS_SERVER"
> -	exit 1
> -fi
> -
> -rsh -n -l root $NFS_SERVER "mount -t $FS_TYPE $REM_DISK_PART $MNT_POINT"
> -if [ $? != 0 ]
> -then
> -	echo "FAILED: Could not mount -t $FS_TYPE $REM_DISK_PART on $MNT_POINT"
> -	exit 1
> -fi
> -
> -rsh -n -l root $NFS_SERVER "chmod 777 $MNT_POINT"
> -if [ $? != 0 ]
> -then
> -	echo "FAILED: Could not chmod 777 $MNT_POINT on $NFS_SERVER"
> -	exit 1
> -fi
> -
> -rsh -n -l root $NFS_SERVER "/usr/sbin/exportfs -i -o no_root_squash,rw *:$MNT_POINT"
> -if [ $? != 0 ]
> -then
> -	rsh -n -l root $NFS_SERVER "umount $MNT_POINT"
> -	rsh -n -l root $NFS_SERVER "rm -rf $MNT_POINT"
> -	echo "FAILED: Could not export remote directory $MNT_POINT"
> -	exit 1
> -fi
> -sleep 15
> -
> -# Here is the code coverage for fs/exportfs
> -#
> -mkdir -p -m 777 $MNT_POINT
> -mount -t nfs $NFS_SERVER:$MNT_POINT $MNT_POINT
> -if [ $? != 0 ]
> -then
> -	echo "FAILED: NFS mount failed"
> -	exit 1
> -fi
> -
> -mkdir -p -m 777 $MNT_POINT/test_dir
> -echo "NFS mount of $FS_TYPE file system and I/O to NFS mount point generates the  fs/exportfs code coverage" > $MNT_POINT/test_dir/exportfs_coverage
> -
> -
> -#######################################################
> -#
> -# Just before exit, perform NFS CLIENT & SERVER cleanup
> -#
> -#######################################################
> -
> -umount $MNT_POINT
> -rm -rf $MNT_POINT
> -
> -rsh -n -l root $NFS_SERVER "/usr/sbin/exportfs -u :$MNT_POINT"
> -rsh -n -l root $NFS_SERVER "umount $MNT_POINT"
> -rsh -n -l root $NFS_SERVER "rm -rf $MNT_POINT"
> -echo "PASSED: $0 passed!"
> -exit 0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
