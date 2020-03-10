Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC517FE4E
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 14:34:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6AED13C6021
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 14:34:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1F5A33C5FFE
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 14:34:29 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 60FD5100159F
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 14:34:28 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02ADWXfO106761;
 Tue, 10 Mar 2020 13:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=ovCaG4vlqzffbpzQlkC5ASXIgNvTV/UvWtNsNcVHDFE=;
 b=uHurBH/eREWe6yl6ZN/3YZgqElFBt69CgZJS6RFCvjt3IAr4oD40ZtCQrFSvJSifJj+o
 GZIrnn61IVmrSR5S/9xlkJu6nVn0pbQAJ7hYWckv5STfwTZ3XICQ5NQfqil6UJSqf0Se
 Bu6u/Omrm5O0uZ2nctgsWbqZLkDJyJcU73E91SSsMwAimAdtLAWqN7LskDAQOXBTWFt2
 kK7Y9dwFF0GEDyhWYcoUkVtNEpvWTwjiRKszThkY6Xk5dnWV1urunRO1lk83TRvT4xij
 5Y2uRH3mcvErYoWflqJcpFuYIuUuWnPNjc7tn/GVCNP5fVk6kelPqRp6UzaYp1Ol05OW Xw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2ym31udjac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 13:34:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02ADYIsw190972;
 Tue, 10 Mar 2020 13:34:25 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2yp8prfat0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 13:34:25 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02ADYOQQ010396;
 Tue, 10 Mar 2020 13:34:24 GMT
Received: from [192.168.1.34] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Mar 2020 06:34:24 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200305192716.10313-1-pvorel@suse.cz>
 <20200305192716.10313-2-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <21baaca8-7c4e-7c11-2ff3-d10cf3e492e5@oracle.com>
Date: Tue, 10 Mar 2020 16:34:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305192716.10313-2-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9555
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003100091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9555
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003100091
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] nfs: Detect disabled UDP
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

On 05.03.2020 22:27, Petr Vorel wrote:
> nfs-utils disabled serving NFS over UDP in version 2.2.1,
> which produce TBROK:
> 
> nfs01 1 TBROK: 'mount -t nfs -o proto=udp,vers=3
> 10.0.0.2:/tmp/LTP_nfs01.3pixnljzEv/3/udp /tmp/LTP_nfs01.3pixnljzEv/3/0'
> failed on '': 'mount.nfs: requested NFS version or transport protocol is
> not supported'
> 
> Detect UDP configuration (parsing all configs) and return TCONF when disabled.
> 
> NOTE: Debian based distros still use older version, once it upgrades, it
> will might keep using current configuration files
> (/etc/default/nfs-kernel-server, /etc/default/nfs-common), therefore
> code might need to be adjusted.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/network/nfs/nfs_stress/nfs_lib.sh | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> index 2d5535dc5..2ba79dfdd 100644
> --- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> @@ -46,6 +46,15 @@ get_socket_type()
>  	done
>  }
>  
> +nfs_server_udp_enabled()
> +{
> +	local config f
> +
> +	tst_rhost_run -c "[ -f /etc/nfs.conf ]" || return 0
> +	config=$(tst_rhost_run -c 'for f in $(grep ^include.*= '/etc/nfs.conf' | cut -d = -f2); do [ -f $f ] && printf "$f "; done')
> +	tst_rhost_run -c "grep -q '^[[:space:]]*udp[[:space:]]*=[[:space:]]*y' /etc/nfs.conf $config"

Looks like the pattern doesn't detect when udp enabled by
default and the config has commented default values,
i.e. '# udp=y'.

grep '^[# ]*udp *= *y' /etc/nfs.conf $config


> +}
> +
>  nfs_setup_server()
>  {
>  	local export_cmd="exportfs -i -o fsid=$$,no_root_squash,rw *:$remote_dir"
> @@ -93,6 +102,10 @@ nfs_setup()
>  		type=$(get_socket_type $n)
>  		tst_res TINFO "setup NFSv$i, socket type $type"
>  
> +		if [ "$type" = "udp" ] && ! nfs_server_udp_enabled; then
> +			tst_brk TCONF "UDP support disabled on NFS server"
> +		fi
> +
>  		local_dir="$TST_TMPDIR/$i/$n"
>  		remote_dir="$TST_TMPDIR/$i/$type"
>  		mkdir -p $local_dir
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
