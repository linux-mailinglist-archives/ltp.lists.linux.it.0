Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9417F9F6
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 14:01:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 520C53C601F
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 14:01:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3FC6F3C0B93
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 14:01:30 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 324AD1001995
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 14:01:30 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02ACqQuW143949;
 Tue, 10 Mar 2020 13:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Oj4xXgRgcs1tlsKdFkHILE4agsPjghTpO+siJ9zCtgk=;
 b=R/znNlqaOjwm30JVjK6MtYhVX7KfFjZ4aRBYPbNJeudxJcPaHLRZidQI7e7eiLHXnu8z
 jyY7wymxkBatEz7Gbnq5U9SSx1481Lk7RE6aBil6zVVPQNGjrADRucHiSTE27qRSkBqx
 8IF/ozcxaXqbb+QClbx30pMyClk3uZTzKospZvsdR5sKZ4nNcckFEdm/IK+KrIKA+haF
 uZty418K2fK9yZ337PuPcsebPzJVEH87DF7Zc+yVmO3jn+N2x0rA9duPYjtF5RxYN4py
 rP6rpDNgothtizDJ7AkJu2LfRsJt7DL/CHadVVEu9oe59RsQ8VVe8tfcyCzgtTiMfCiI 9g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2yp9v60f8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 13:01:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02ACrSci058592;
 Tue, 10 Mar 2020 13:01:25 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2yp8rhtsrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 13:01:25 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02AD1Ksg027565;
 Tue, 10 Mar 2020 13:01:24 GMT
Received: from [192.168.1.34] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Mar 2020 06:01:19 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200305192716.10313-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <5b00a232-d175-9cb1-ba20-ccd5d6e93cdc@oracle.com>
Date: Tue, 10 Mar 2020 16:01:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305192716.10313-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9555
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0 mlxscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003100086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9555
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003100086
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] nfs_lib: Unify testing on netns
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,
On 05.03.2020 22:27, Petr Vorel wrote:
> There is no need to run tests on opposite client/server when using
> $TST_USE_NETNS based setup. It's enough just to set lhost IP address.
> This simplifies code a bit.

It changes the testcase, this way nfs traffic will go through
lo interface, the test won't use ltp_ns_veth* and netns.

We could add the knob for this scenario with LTP_NFS_USE_NETNS={1|0}?

> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/network/nfs/nfs_stress/nfs_lib.sh | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> index 66f2fb038..2d5535dc5 100644
> --- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> @@ -50,14 +50,6 @@ nfs_setup_server()
>  {
>  	local export_cmd="exportfs -i -o fsid=$$,no_root_squash,rw *:$remote_dir"
>  
> -	if [ -n "$LTP_NETNS" ]; then
> -		if [ ! -d $remote_dir ]; then
> -			mkdir -p $remote_dir
> -			ROD $export_cmd
> -		fi
> -		return
> -	fi
> -
>  	if ! tst_rhost_run -c "test -d $remote_dir"; then
>  		tst_rhost_run -s -c "mkdir -p $remote_dir; $export_cmd"
>  	fi
> @@ -79,11 +71,6 @@ nfs_mount()
>  	local mnt_cmd="mount -t nfs $opts $mount_dir $local_dir"
>  
>  	tst_res TINFO "Mounting NFS: $mnt_cmd"
> -	if [ -n "$LTP_NETNS" ]; then
> -		tst_rhost_run -s -c "$mnt_cmd"
> -		return
> -	fi
> -
>  	ROD $mnt_cmd
>  }
>  
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
