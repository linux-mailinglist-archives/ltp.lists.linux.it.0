Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 108DB613890
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 15:00:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98CF03CAAF1
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 15:00:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 71DEF3C04BF
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 14:47:33 +0100 (CET)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 116202002C9
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 14:47:30 +0100 (CET)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29VCjfnE028099;
 Mon, 31 Oct 2022 13:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=ifxWG2bDAVn/QfYyZSp+rIzU0LMnvmNsnVDQqIgPj9Q=;
 b=NJQ5dfavuXW2PvmIbJ7n18sro4J/kASfXWTt+kWrWSIghXJSi3NLYVphQxCDsJub8adj
 0XqXQEv3Qy/fyPX7gf8VFmFFXDMy5EYzzw1tAxviRM1YHOIqNlQyNUk1L9ihsgIICzjN
 9aZWn4Op9+dgxh2OZm7FSbzYG4S9l11H9xElItfuW1ovQkiE9UqmSN9pXlLM1z2jZPUF
 ckpmFq6uXH3ERW0RU8EcQQKPwefWgND3xUEBpKa+aqHgfl7zRDCKR48ULvkENNY39hUH
 0hgJtqsKMnEqEHb9c3NIfh5CcQEaWF5+zh/HF4A696HLjEWWYZCfTZVNXhC4kAObhHM1 wg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kgv2abjm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Oct 2022 13:47:23 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29VD6F7d030893; Mon, 31 Oct 2022 13:47:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kgtm9bah2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Oct 2022 13:47:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZw9Qn3qVub16Ktzm/SsG2Lb1LgWSwhgl2c+oJ1RkGJbEf5/hz6lkBVT6LT3mtv0IJodVR2t8sK2hqlcsrX15axvM03Z6UJhtKdQszpT7NScVnERuQlDUXXb2QDBpDjBNK4vR3j/VBlVSakbUJJFWEDcTsRLDOwEh7MHT/P66Q7H6YeiS/Ct0vn/j8SosZP3Xard0jtLkaBQuGRmXfNY6B9nFEWwoucnz+DOlH4LwrTZMVZSHNWHGzADiAXOHyxQxPyhYaGAZ8/NlqRwJvMsyCXekfl0+UH1HIsIl93MjMaaj16jMGIBadyVm8SUPtJLP7mXilB5Aty5Z+9zGq5lsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifxWG2bDAVn/QfYyZSp+rIzU0LMnvmNsnVDQqIgPj9Q=;
 b=lAfjIaLzi8tN4GXeSK/QlWiPy9GbeCJxQ8H1A0xGb2LjKMKxpv6OVAJura4CwLe6zl4klQLnsiEvdYI3XnfEkoWID+Vnk+XIq7COWh1QILW5PEtXxHlgxu9rnR1+2ngf+DA62IQduhP7AuxvAyLCqc/WQTviwLOLHdtyqD0Iv1AaKpSWf29MO0rtVaHKQNFFPGSBswmFhMq70Vz0OuM8fd5sDgNbm8Xcd+vwrAbqMhGzi8zGv4XmiEOMn57Omj0c0LC0mBTBpCLUA2iUB7awEgZqokI4vF82ZNrQz8fjYMxCSPRPB1bkF3eNzxSO5R68ezd/ZhmxOAqnw6drVwKGug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifxWG2bDAVn/QfYyZSp+rIzU0LMnvmNsnVDQqIgPj9Q=;
 b=aZN8jff5JAvZvVUWqQavYmB73GtxnfDAHBYQ91pVQmuEiuWDCHvcoxjx+GF0ZvUzFWNWgx/Q3HKHENf3vQBpN5SFso19fFQAtL4smNPi1ZJr3i2Bfb+YYK/bZtU8gdlKgXUh1gTg55tnxBrkgSXpMaSuiGVeFL2pXKh1APYpjK0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB6244.namprd10.prod.outlook.com (2603:10b6:208:3a0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Mon, 31 Oct
 2022 13:47:17 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5403:3164:f6c3:d48a]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5403:3164:f6c3:d48a%3]) with mapi id 15.20.5769.021; Mon, 31 Oct 2022
 13:47:17 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Petr Vorel <pvorel@suse.cz>, Jeff Layton <jlayton@kernel.org>
Thread-Topic: LTP test regression on exportfs in kernel 6.0
Thread-Index: AQHY7S4loXwca/zxR068CBPRlRx9Uq4ohDYA
Date: Mon, 31 Oct 2022 13:47:17 +0000
Message-ID: <5AE322AD-FF73-4495-A3DF-60A98DBE49A7@oracle.com>
References: <Y1/P8gDAcWC/+VR3@pevik>
In-Reply-To: <Y1/P8gDAcWC/+VR3@pevik>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|IA1PR10MB6244:EE_
x-ms-office365-filtering-correlation-id: b8588204-53b4-4a4c-2d27-08dabb466cf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S9BrUNjk9luDsICqZf5UQmUlue+K/Wh/S+pnyk7OShXF/vhGcj7X/7J+SpSik3PufaiAEU4WPCTWdxzY4dEh10zUA9fegrKJWYSNK7PujBUYsYrEjdu3SNs3bbTuOKKIaJtVMlGWZeP8sjWV1sUtmToSSAh0AcrwiRBrpDbE0amc4eZ2S8Yk5R21C9YT1tHZFoD/mYt2PZaUxg1kStbDcpdLXQne62feaWEamdIyM2ymTLwoUE5yCuwaDutILAgwSbG4U1ksooHjQsXoQTIlNuc+1l2ko5hcGgAJVxXhgEtG9ocE0S8vBTP/EwLkzoKW9WusqycnNb/WAGF4JTqFf02jGfvD4kmKjiUBQuZQYCpJJ5Bun/oXAz1E6K8dRcg4np6Ry48fs6ItkJA0Wndp88nPET4zFmh1RjvdtOtWwwUuy3Shj68E3dJVY0atzUH439WVetIBGW91Y4SHYt284TFeBCOid3I28G0KMAsuBHUylrFCPRBt4lAVS3b1OrTnhk7ElaqRVJL0JX+NTbGkOUjsiG6+RkLmQhPgtILua3Pqi3Jx0Z6jDPuZUOtsk7abCnjT2hfw1N+U7s5PmCS3cGNO1A/dYZBrHev/qjJcKU4or1UAyMF1UORG7E8OYnYrPlveFoQvWD6+hbYVbhucfWEMdtyK0pBFC2jIJi8Me8Pt3ze3j9pzZSJ02KDLSwogzLV64rU+D2y03Nvmb2ccAXNj06xll1NVdafFgaKH6IKg8XiTdp9bIFsMyDsqL4/o2rq053M6GhNwjUuXxAkA2i32AamnhyXwXFTr+3aG0PWazHkd6cxXX6kY9GPVhd5anYowUZNSF3kMfWJ7oczlRIgMo/vEGUTEVAVyWaR4hH++mjZx1SOFx5oZW74x5Mj4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5128.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199015)(38070700005)(26005)(86362001)(33656002)(36756003)(6512007)(41300700001)(6506007)(53546011)(4326008)(8676002)(186003)(2616005)(5660300002)(45080400002)(66446008)(66556008)(66476007)(64756008)(966005)(71200400001)(30864003)(8936002)(6486002)(66946007)(76116006)(478600001)(91956017)(110136005)(316002)(122000001)(54906003)(38100700002)(83380400001)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gsDvr3Y45HltU6CSE3b9ymWvqBqqOIPEl+vRYxIlbwEDhPlTyEogdsjFAwdd?=
 =?us-ascii?Q?w45CFPUAGh1JAzpE9455omX0wkOvPJ9+H6RhlWk9EcjVhEeFYEM8bFVvTkmd?=
 =?us-ascii?Q?pV2V5PrW9o4cWwWEeFDipGuq1LwJ8ap4IDv0frIACoYZGTRhmVb9bLpcjBhV?=
 =?us-ascii?Q?qQ/YDySJSGpheFfyfyjzgKtlvSEl+UXnFZgSr2KV1/sbayCEOfXGSiEpvfuV?=
 =?us-ascii?Q?++pIH6QUtcGPuqVILp9A+HDQXefwRj+4XNOQUFxiqTdm4/SrvQmc8kXQUiFU?=
 =?us-ascii?Q?ypA2B5PTnqiypEoNNOrkdJRWSjgicVu4mBtRBhZIowkgn3ZnlEbC6V8xFIu9?=
 =?us-ascii?Q?CbqR/9w89hPwGI23kOIG76BxL57ng+sFzNGPmt09cq4FUyqWFqIAw6T9DU5q?=
 =?us-ascii?Q?rGo/GxSnyf2gU170aiUxbGUyAig7jENUbu08kwr3wdKZwxXSaDN3yjmQXhMM?=
 =?us-ascii?Q?r/2O/zP7wdJ4ihlPBNI3JtE69WpUdUIjTqAjCgGRH6u11VXkOosx3kbJlfDa?=
 =?us-ascii?Q?xXE2AmEwtZp5r6C95ZZjEXpEqKjxsf145wYSO6DdeXu1ZpbgkzoihOH6TaXD?=
 =?us-ascii?Q?V6sOlQ76A0pCpGRB8oqiRH6ifgpvZY8ESvz2qIDInAMogUZJ3CP8v5I5BNVk?=
 =?us-ascii?Q?eLQYOVSznX82xaLe23YjWof4kvQUVKb+ESRYQ/FlOy8o/Iug2FGpudb+QP+L?=
 =?us-ascii?Q?9NMRkMijiop4ER0se+hJfJEjJwJfTjYhnSHRqqUjIov8yRHHn299JqPCn3vD?=
 =?us-ascii?Q?H6PGB/g8TkfLJHLxFivElUDnlUzH8ZA2hMECHFG+1QjBESehtVcN8ETWMdbJ?=
 =?us-ascii?Q?kzbqZfJvKqlkavWx7famBhcSSfCLYz8d1/kskmIb1CGJjZczBoxP81xm0Y+r?=
 =?us-ascii?Q?4CSJChvwyFu+jfuJXlufzPZ1kD1z68ytNGdo1ZbVsMflx0o8ejDvWjgizrKL?=
 =?us-ascii?Q?XFEpnt4Newq8n6+zfrS1IRpKe74DF7EuTevYBHsM6PhTpXrVo3hoOZUM/hPJ?=
 =?us-ascii?Q?eVgw//Qvs8upaQQ1OQO0c02cw/g4WPPtlhU+JT9oz4sKV4Whuwj4uMi5t3sG?=
 =?us-ascii?Q?tSmjx6+gAel5icsbGBMb+XxpvgqZdJ36BMmBLxxhu1+J7Fwqq5xysIMDWgSQ?=
 =?us-ascii?Q?DC46WJC2BJcTlpLAP9JaF25EjcPv/BMs/S/O20mhtIxx63y02d4rGlkj1BHr?=
 =?us-ascii?Q?RIMdOP7ggZ1viZSlXk8KtLUFQfPjYKy2MKDUaoRDn3Q5I4i8WGoVLKqhhZD/?=
 =?us-ascii?Q?sLBYh5UBGneQvnEMkL4iVJQjIczSn6kcsYugskl2toiy/wFKs2BQKYib9YNT?=
 =?us-ascii?Q?ILlbnteoJC28BRMzcU0SHUU0Q0jJvIM781dB6lk4kCEySf2TP0WnPJktmI0P?=
 =?us-ascii?Q?CVSWHMAWo9x8FpWhu4AAYXrYxxjCI0SK3CTtg57j3RAVXNImduM71g+kQK7/?=
 =?us-ascii?Q?AfzMRfT4QfH1XsOI58Y2yJjxAg5NTrw4cZzz2DThUeJVwTNXQdmbwDGBY42n?=
 =?us-ascii?Q?Q6j5uL1RgZAeXQMCFjzlCV5beLlOBJdBnVsWx8ihe3VYLDxYQQcoTkL52+nH?=
 =?us-ascii?Q?yovBpGSS0BgxhDOG6mzG9spMQ0i/cEX0eDdoIg8Y3OYEpZEI4T/B+J7hSJUn?=
 =?us-ascii?Q?IA=3D=3D?=
Content-ID: <5059DFF29214364AA3FF68D0B0383105@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8588204-53b4-4a4c-2d27-08dabb466cf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2022 13:47:17.5833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GhZeD04RlQi/6VYsKz2KhGgJEUDx0SIM4BKtbkS1JZ5jr7u9k48qiRDT1pZT5irxunMtrFz5cuSXiRy05KtQeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6244
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_15,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310086
X-Proofpoint-ORIG-GUID: ceBS50EWaSyUY-da8FdfVjkYB_Xi9NRT
X-Proofpoint-GUID: ceBS50EWaSyUY-da8FdfVjkYB_Xi9NRT
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 31 Oct 2022 14:59:49 +0100
Subject: Re: [LTP] LTP test regression on exportfs in kernel 6.0
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
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 NeilBrown <neilb@suse.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Steve Dickson <steved@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

[ dropping Bruce, he's no longer an NFSD maintainer ]


> On Oct 31, 2022, at 9:38 AM, Petr Vorel <pvorel@suse.cz> wrote:
> 
> Hi all,
> 
> LTP tests got broken on kernel 6.0. During test cleanup it hangs on exportfs
> (high load). I tested it both on nfs-utils 2.6.2, the same userspace, the
> version of the tests (obviously), it looks really like kernel related regression.

Not oopsen, but rather RCU splats.

[  326.587135] rcu: INFO: rcu_preempt self-detected stall on CPU
[  326.587168] rcu: 	0-....: (5249 ticks this GP) idle=cf74/1/0x4000000000000000 softirq=7256/7256 fqs=2484
[  326.587187] 	(t=5250 jiffies g=4009 q=388 ncpus=2)

and

watchdog: BUG: soft lockup - CPU#0 stuck for 44s! [exportfs:1180]

RIP: __nfsd_file_cache_purge+0x54

seems like the common element. Jeff, can you have a look at this?


> # Simple reproducer
> git clone https://github.com/linux-test-project/ltp.git
> # install dependencies with your distro in ci/*.sh
> make autotools && ./configure && make -j$(getconf _NPROCESSORS_ONLN) && make install
> export LTPROOT=/opt/ltp; PATH="/opt/ltp/testcases/bin:$PATH" nfs02.sh -v 4 -t tcp
> TMPDIR="/var/tmp" nfs02.sh -v 4 -t tcp
> 
> # Example on kernel oops on openSUSE
> [  304.772002] Initializing XFRM netlink socket
> [  304.833577] IPv6: ADDRCONF(NETDEV_CHANGE): ltp_ns_veth1: link becomes ready
> [  304.833604] IPv6: ADDRCONF(NETDEV_CHANGE): ltp_ns_veth2: link becomes ready
> [  304.957269] FS-Cache: Loaded
> [  305.002821] Key type dns_resolver registered
> [  305.153926] NFS: Registering the id_resolver key type
> [  305.153942] Key type id_resolver registered
> [  305.153943] Key type id_legacy registered
> [  326.587135] rcu: INFO: rcu_preempt self-detected stall on CPU
> [  326.587168] rcu: 	0-....: (5249 ticks this GP) idle=cf74/1/0x4000000000000000 softirq=7256/7256 fqs=2484
> [  326.587187] 	(t=5250 jiffies g=4009 q=388 ncpus=2)
> [  326.587191] NMI backtrace for cpu 0
> [  326.587192] CPU: 0 PID: 1008 Comm: exportfs Not tainted 5.19.0 #4
> [  326.587195] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552-rebuilt.opensuse.org 04/01/2014
> [  326.587199] Call Trace:
> [  326.587212]  <IRQ>
> [  326.587216]  dump_stack_lvl+0x45/0x5e
> [  326.587231]  nmi_cpu_backtrace.cold+0x30/0x76
> [  326.587234]  ? lapic_can_unplug_cpu+0x80/0x80
> [  326.587241]  nmi_trigger_cpumask_backtrace+0x10c/0x140
> [  326.587252]  rcu_dump_cpu_stacks+0xf8/0x130
> [  326.587260]  rcu_sched_clock_irq.cold+0x67/0x2f8
> [  326.587270]  ? raw_notifier_call_chain+0x41/0x60
> [  326.587275]  ? timekeeping_update+0xde/0x130
> [  326.587280]  ? __cgroup_account_cputime_field+0x5d/0x90
> [  326.587286]  update_process_times+0x62/0x90
> [  326.587291]  tick_sched_handle+0x22/0x60
> [  326.587300]  tick_sched_timer+0x71/0x90
> [  326.587303]  ? tick_sched_do_timer+0xa0/0xa0
> [  326.587306]  __hrtimer_run_queues+0x127/0x2c0
> [  326.587310]  hrtimer_interrupt+0x106/0x220
> [  326.587313]  __sysvec_apic_timer_interrupt+0x7c/0x170
> [  326.587319]  sysvec_apic_timer_interrupt+0x9d/0xd0
> [  326.587328]  </IRQ>
> [  326.587328]  <TASK>
> [  326.587329]  asm_sysvec_apic_timer_interrupt+0x16/0x20
> [  326.587339] RIP: 0010:__nfsd_file_cache_purge+0x54/0xd0 [nfsd]
> [  326.587374] Code: 48 89 24 24 48 89 64 24 08 e8 88 3e e8 e5 48 8d 7c 24 10 e8 ae 53 e8 e5 48 8d 7c 24 10 e8 04 4d e8 e5 48 89 c5 48 85 c0 74 27 <48> 81 fd 00 f0 ff ff 77 55 48 85 db 74 06 48 39 5d 38 75 ec 48 89
> [  326.587376] RSP: 0018:ffffbfe84100bd88 EFLAGS: 00000202
> [  326.587378] RAX: ffff9dcd01f9a3a8 RBX: ffff9dcd0af86600 RCX: ffffffffc0ceabc0
> [  326.587380] RDX: 0000000000000000 RSI: 000000000000008c RDI: ffffbfe84100bd98
> [  326.587381] RBP: ffff9dcd01f9a3a8 R08: 0000000000000000 R09: ffffffffa6fd2b75
> [  326.587382] R10: 0000000000000000 R11: ffffbfe84100bd98 R12: ffffbfe84100bf08
> [  326.587383] R13: 00007fff97dc3a20 R14: ffffbfe84100bf08 R15: 0000000000000000
> [  326.587385]  ? _raw_spin_unlock+0x15/0x30
> [  326.587393]  ? __nfsd_file_cache_purge+0x4c/0xd0 [nfsd]
> [  326.587410]  ? _raw_spin_unlock+0x15/0x30
> [  326.587412]  expkey_flush+0x2a/0x40 [nfsd]
> [  326.587427]  write_flush.constprop.0+0xf4/0x140 [sunrpc]
> [  326.587460]  proc_reg_write+0x4e/0x90
> [  326.587470]  vfs_write+0xc3/0x3d0
> [  326.587478]  ? preempt_count_add+0x4d/0xa0
> [  326.587482]  ? fd_install+0x5c/0xe0
> [  326.587489]  ksys_write+0x5f/0xe0
> [  326.587492]  do_syscall_64+0x38/0xc0
> [  326.587496]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [  326.587501] RIP: 0033:0x7f6f908063f3
> [  326.587505] Code: 8b 15 21 9a 0f 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 55 c3 0f 1f 40 00 48 83 ec 28 48 89 54 24 18
> [  326.587506] RSP: 002b:00007fff97dc3a08 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [  326.587508] RAX: ffffffffffffffda RBX: 000056110e2f8dd0 RCX: 00007f6f908063f3
> [  326.587509] RDX: 000000000000000b RSI: 00007fff97dc3a20 RDI: 0000000000000006
> [  326.587510] RBP: 000056110e2f500e R08: 00007f6f908b83e0 R09: 0000000000000000
> [  326.587512] R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff97dc3ad0
> [  326.587514] R13: 00007fff97dc3a20 R14: 0000000000000006 R15: 000056110e2f4fef
> [  326.587517]  </TASK>
> 
> # Bug on Debian config with openSUSE setup looks fairly similar:
> [ 7972.371206] watchdog: BUG: soft lockup - CPU#0 stuck for 44s! [exportfs:1180]
> [ 7972.371250] Modules linked in: rpcsec_gss_krb5 nfsv4 dns_resolver nfs fscache netfs xfrm_user xfrm_algo veth intel_rapl_msr intel_rapl_common intel_pmc_core_pltdrv intel_pmc_core kvm_intel kvm irqbypass ghash_clmulni_intel snd_hda_codec_generic ledtrig_audio aesni_intel crypto_simd cryptd rapl qxl evdev snd_hda_intel drm_ttm_helper snd_intel_dspcfg serio_raw pcspkr snd_intel_sdw_acpi ttm joydev virtio_console virtio_balloon snd_hda_codec sg drm_kms_helper snd_hda_core snd_hwdep snd_pcm qemu_fw_cfg snd_timer snd soundcore button nfsd auth_rpcgss nfs_acl lockd grace sunrpc drm fuse configfs virtio_rng rng_core ip_tables x_tables autofs4 btrfs blake2b_generic xor raid6_pq zstd_compress libcrc32c crc32c_generic hid_generic usbhid hid dm_mod virtio_net net_failover virtio_blk failover sr_mod cdrom crct10dif_pclmul crct10dif_common crc32_pclmul crc32c_intel psmouse ata_generic uhci_hcd ehci_pci ehci_hcd ata_piix usbcore libata usb_common virtio_pci virtio_pci_legacy_dev virtio_pci_mod
 ern_dev
> [ 7972.371310]  virtio virtio_ring scsi_mod i2c_piix4 scsi_common floppy
> [ 7972.371315] CPU: 0 PID: 1180 Comm: exportfs Not tainted 6.0.1 #2
> [ 7972.371317] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552-rebuilt.opensuse.org 04/01/2014
> [ 7972.371318] RIP: 0010:__nfsd_file_cache_purge+0x54/0xd0 [nfsd]
> [ 7972.371344] Code: 48 89 24 24 48 89 64 24 08 e8 38 23 46 d4 48 8d 7c 24 10 e8 5e 38 46 d4 48 8d 7c 24 10 e8 b4 31 46 d4 48 89 c5 48 85 c0 74 27 <48> 81 fd 00 f0 ff ff 77 55 48 85 db 74 06 48 39 5d 38 75 ec 48 89
> [ 7972.371348] RSP: 0018:ffffc05241067d88 EFLAGS: 00000202
> [ 7972.371350] RAX: ffff9bd3c5380618 RBX: ffff9bd3f260d500 RCX: ffffffffc0b0cbc0
> [ 7972.371351] RDX: 0000000000000000 RSI: 00000000000000b2 RDI: ffffc05241067d98
> [ 7972.371352] RBP: ffff9bd3c5380618 R08: 0000000000000000 R09: ffffffff953d3aa5
> [ 7972.371353] R10: 0000000000000000 R11: ffffc05241067d98 R12: ffffc05241067f08
> [ 7972.371354] R13: 00007ffd820fd9f0 R14: ffffc05241067f08 R15: 0000000000000000
> [ 7972.371356] FS:  00007fd3e4d1c740(0000) GS:ffff9bd3fec00000(0000) knlGS:0000000000000000
> [ 7972.371357] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 7972.371358] CR2: 00007fd3e4d8a040 CR3: 00000000089a6005 CR4: 0000000000370ef0
> [ 7972.371362] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 7972.371363] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [ 7972.371364] Call Trace:
> [ 7972.371367]  <TASK>
> [ 7972.371376]  ? _raw_spin_unlock+0x15/0x30
> [ 7972.371383]  expkey_flush+0x2a/0x40 [nfsd]
> [ 7972.371402]  write_flush.constprop.0+0xf4/0x140 [sunrpc]
> [ 7972.371440]  proc_reg_write+0x4e/0x90
> [ 7972.371443]  vfs_write+0xc3/0x3d0
> [ 7972.371446]  ? preempt_count_add+0x4d/0xa0
> [ 7972.371450]  ? fd_install+0x5c/0xe0
> [ 7972.371452]  ksys_write+0x5f/0xe0
> [ 7972.371454]  do_syscall_64+0x38/0xc0
> [ 7972.371458]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [ 7972.371460] RIP: 0033:0x7fd3e4e193f3
> [ 7972.371462] Code: 8b 15 21 9a 0f 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 55 c3 0f 1f 40 00 48 83 ec 28 48 89 54 24 18
> [ 7972.371464] RSP: 002b:00007ffd820fd9d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [ 7972.371466] RAX: ffffffffffffffda RBX: 00005559a20e4dd0 RCX: 00007fd3e4e193f3
> [ 7972.371467] RDX: 000000000000000b RSI: 00007ffd820fd9f0 RDI: 0000000000000006
> [ 7972.371468] RBP: 00005559a20e100e R08: 00007fd3e4ecb3e0 R09: 0000000000000000
> [ 7972.371469] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffd820fdaa0
> [ 7972.371470] R13: 00007ffd820fd9f0 R14: 0000000000000006 R15: 00005559a20e0fef
> [ 7972.371473]  </TASK>
> 
> I guess I don't need to turn any debugging with rpcdebug at this point (enough
> info from this), right?
> 
> It looks like to be config related, because it's broken with openSUSE config,
> but not with Debian config. Building with Debian config, but changing just these
> NFS specific options it also fails:
> 
> # config difference Debian (-) vs openSUSE (+)
> -CONFIG_NFS_DISABLE_UDP_SUPPORT=y
> +# CONFIG_NFS_DISABLE_UDP_SUPPORT is not set
> -# CONFIG_NFSD_SCSILAYOUT is not set
> -# CONFIG_NFSD_FLEXFILELAYOUT is not set
> -# CONFIG_NFSD_V4_2_INTER_SSC is not set
> +CONFIG_NFSD_SCSILAYOUT=y
> +CONFIG_NFSD_FLEXFILELAYOUT=y
> +CONFIG_NFSD_V4_2_INTER_SSC=y
> 
> I suspect it was caused by e394ff83bbca ("Merge tag 'nfsd-6.0' of
> git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux") [1], but I need to
> finish bisecting to be sure (it was merged earlier than aeb6e6ac18c7 ("Merge tag
> 'nfs-for-5.20-1' of git://git.linux-nfs.org/projects/trondmy/linux-nfs") [2],
> both are broken).
> 
> Kind regards,
> Petr
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e394ff83bbca1c72427b1feb5c6b9d4dad832f01
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aeb6e6ac18c73ec287b3b1e2c913520699358c13

--
Chuck Lever




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
